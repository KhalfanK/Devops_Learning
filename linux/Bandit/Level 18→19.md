# Bandit Level 18→19 - Combining SSH and commands 



## **Challenge:**


The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.


## **Solution:**

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 'cat readme'
#When you log in the next password is output before disconnection
```


## **Explanation:**


By appending commands in quotes at the end of the `ssh` command, we can execute them on the remote machine on connection. We use this to `cat` the `readme` file before disconnecting, giving us the password.

This solution works because `ssh` allows you to run commands before the shell fully initialises, before the change in `.bashrc` forces disconnection. 


## **Reflections:**


This level made me feel like a hacker. This must be how hackers exploit small features to affect millions of web servers, an example of that could be one I read about a few days ago named Heartbleed, where a bug in openssl allowed attackers to steal encryption keys and passwords. 