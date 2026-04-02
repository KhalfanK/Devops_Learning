# Bandit Level 3→4 - Hidden Files



## **Challenge:**



The password for the next level is stored in a hidden file in the `inhere` directory.


## **Solution:**



```bash
ls -a
#reveals hidden directory called 'inhere'


cd inhere


ls -a
#reveals hidden file called '...Hiding-From-You'

 
cat ...Hiding-From-You

```



## **Explanation:**



The `ls -a` lists files in the current directory, this is used with the `-a` option which tells the shell that you want to list all files which include hidden ones.

The first `ls -a` reveals a hidden directory called `inhere`.

The `cd` command allows you to change the directory that the terminal is working in.

The `ls -a` command is used again in the new directory which reveals a hidden file called `...Hiding-From-You`.

The `cat` command prints the contents of the file to the terminal which gives the password to the next level.


## **Reflections:**

This level introduced me to hidden files in Linux. I now know that any file prefixed with a `.` is treated as hidden, which is why `ls` doesn't show them by default, the `-a` flag is needed to reveal them. What surprised me is that this isn't actually a security feature, it's purely a convenience to reduce clutter. Anyone with access to the directory can see hidden files with `ls -a`, so the word "hidden" is a bit misleading. It also explained why `.` and `..` show up when you run `ls -a` — they follow the same dot-prefix rule, just as special entries the system creates automatically for every directory.


