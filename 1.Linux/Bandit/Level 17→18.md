# Bandit Level 17→18 - DIFF Command



## **Challenge:**



There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new


## **Solution:**

```bash
ls
#Reveals two file 'passwords.old' and 'password.new'

diff passwords.old passwords.new
```
```
#Output
42c42
< BMIOFKM7CRSLI97voLp3TD80NAq5exxk
---
> x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
```



## **Explanation:**

`diff` is a useful command to find changes that have been made between files, in this case `diff passwords.old passwords.new`, looks line by line for changes between the file. There is one line that changed, therefore that is our password as specified in the challenge section.

A useful thing to know is at the very beginning of the output we see `42c42`. What this means is the line number `42` in the first file has been changed `c` and corresponds to the line number `42` in the second file. If we saw `a` it would mean lines added and `d` would mean lines deleted.


## **Reflections:**


Knowing the little details about the outputs of commands could come in handy later. After some research I found `diff` is actually used constantly in DevOps, git diffs, comparing config files, checking changes between deployments and more.
