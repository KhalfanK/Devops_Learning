# Bandit Level 6→7 - Searching by file properties pt.2







## **Challenge:**




The password for the next level is stored somewhere on the server and has all of the following properties:



		owned by user bandit7

		owned by group bandit6

		33 bytes in size





## **Solution:**



```bash

find / -size 33c -user bandit7 -group bandit6 2>/dev/null

#Outputs file called /var/lib/dpkg/info/bandit7.password



cat /var/lib/dpkg/info/bandit7.password

```







## **Explanation:**





Similar to the previous level, we are given useful information about the properties of the file that can aid in filtering our search. The find command looks at all files starting from the root directory `/`, `-size` lets the shell know that the file takes up 33 bytes, `-user` filters by the user that owns the file which is bandit7 in this case, and `-group` filters by the group that owns the file, which is bandit6 in this case.



You may notice `2>/dev/null` at the end of the command — without this, the terminal is flooded with permission error messages making the output difficult to read. This introduces the third standard stream alongside `stdin` and `stdout` — `stderr` (standard error), which is where error messages are sent separately from normal output. `2` refers to `stderr`, `>` redirects it, and `/dev/null` is a special file in Linux that discards everything written to it. So `2>/dev/null` simply means throw away all error messages, leaving only the results we care about.

This outputs the path of a singular file that meets all the specifications we set, so we know exactly where it is and can use `cat` to print its contents to `stdout`.





## **Reflections:**





This level was interesting because I arrived at `2>/dev/null` completely through experimentation. When I first ran the command without it, the terminal was flooded with error messages making it nearly impossible to find the actual result. That frustration sent me researching how to get rid of them, which led me to discovering that error messages have their own dedicated stream, `stderr`. It completed the picture for me, having already learnt about `stdin` and `stdout` in earlier levels, finding out there was a third stream that I hadn't considered made everything feel a bit more whole. I think this is a good example of how error messages aren't just noise, they're signposts that push you towards learning something new.







