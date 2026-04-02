# Bandit Level 5→6 - Searching by file properties



## **Challenge:**



The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

    human-readable
    1033 bytes in size
    not executable



## **Solution:**



```bash
cd inhere
ls
#Outputs 20 directories


du -ab | grep 1033
#Output: 1033    ./maybehere07/.file2


cat ./maybehere07/.file2
```



## **Explanation:**


When we use the `ls` command, 20 directories are revealed. The file that we are searching for could be in any one of them. Since we know some properties of the file, we can use this to search with commands. 

The `du` command measures the disk space that directories take up, two flag options were used in the solution above, the `-a` flag means check the disk usage of all files (not just directories) in the current directory, and the `-b` flag means display the information as bytes - this is useful to us as we know that the file is exactly 1033 bytes. 

The `|` symbol is known as a pipe, this is an output redirection tool that allows you to feed the output of a command as the input of another. And we can follow this up with `grep` (global regular expression print) which seeks to match the input we give it with a pattern we are looking for, the pattern in this case is `1033` that the `du` command outputs.

This returns only one file, the one we were searching for. So we use `cat` to print its contents to `stdout`.


## **Reflections:**


I since learned there was an easier way of doing this in one line.

```bash
find . -size 1033c -not -executable -readable
# Output: ./maybehere07/.file2
```

Which goes to show knowledge is power but also shows that solutions can be solved in a multitude of ways, something that extends beyond the terminal to real-life problems, both personal and DevOps related.



