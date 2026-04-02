# Bandit Level 19→20 - setuid



## **Challenge:**



To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.


## **Solution:**

```bash
ls -l
```
```
#Output
-rwsr-x---   1 bandit20 bandit19 14884 Oct 14 09:26 bandit20-do
```
```bash
./bandit20-do cat /etc/bandit_pass/bandit20
#Outputs password for next level
```


## **Explanation:**

`ls -l` is the long form of the command which prints useful information: File permissions, Number of links, Owner, Group, File Size, Modifaction Date and File/Directory Name.

In Unix-like systems, the `setuid` allows users to run an executable with the file system permissions of the executables owner. In the output we see `rws` where you would expect to see `rwx`. This is called a `setuid` bit, the `s` in this case means you can run this file as `bandit20`.

So we run the executable `./bandit20-do` to `cat /etc/bandit_pass/bandit20` which is where the password is stored for the next level, `bandit20` has read permissions for this file.


## **Reflections:**

This level introduced `setuid`, a **permission bit** in Unix-like systems that allows a user to run an executable with the permissions of the file's owner rather than their own. It's a powerful feature, but worth knowing that misconfigured setuid binaries are a common vector for privilege escalation attacks, where an attacker exploits elevated permissions to gain access they shouldn't have. A small misconfiguration at this level, and suddenly someone who isn't bandit20... is.
And on that note — that's level 20 done.


