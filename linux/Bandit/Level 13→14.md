# Bandit Level 13→14 - SSH using key



## **Challenge:**



The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Look at the commands that logged you into previous bandit levels, and find out how to use the key for this level.


## **Solution:**

```bash
ls
#Outputs file called sshkey.private

cat sshkey.private
#Outputs RSA Key


#On Local machine 
ssh -i /example/path bandit14@bandit.labs.overthewire.org -p 2220    #automatically logs me in as bandit 14 
```



## **Explanation:**

After using `ls` we find a private SSH Key in the `sshkey.private` file, so we `cat` that. Attempting to `ssh` directly from the bandit server to another level resulted in an error, this may be a recent configuration change as older solutions online show this working. The workaround is to copy the key to your local machine instead.

Navigate to the folder you saved your key, change the permissions of the file by right-clicking the file in File Explorer, navigating to Properties → Security, and setting it to read-only for your user only ( this method was a workaround due to WSL permission limitations).

The `i` flag lets the `ssh` tool know that you want to connect using a private key. The key automatically allows you to enter without a password, as it verifies that the key belongs to **bandit14**.


## **Reflections:**


This is where I realised there was a massive difference in navigating in Windows OS, and Linux. There was some overlap for example `cd` and many other examples. I tried to `chmod 400` to change the RSA key to read-only but it wouldn't change, at first it was because I thought I didn't include `sudo`, but it was to do with the configuration of `wsl` not being allowed to execute certain commands. I didn't know how to change file permissions in windows, so I just opened up windows file explorer and did it that way. Also I found out that it is good practice to add SSH keys to a dedicated folder, I didn't know that at the time, so I had to change permissions manually in a random folder.