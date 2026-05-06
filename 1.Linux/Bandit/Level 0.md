# Bandit Level 0 - SSH Login



## **Challenge:**



Log into the game using the provided SSH credentials.



## **Solution:**



```bash
ssh bandit0@bandit.labs.overthewire -p 2220

#Password: bandit0
```

## **Explanation:**



This involved learning how to use the `ssh` (secure shell) command, which is a tool which allows for securely logging into remote machines and executing commands over an encrypted connection.



The `ssh` command requires the username and host server you're trying to connect to in the format **'user@hostname'**.



The default port is `22`, the `-p` flag is used to override this and connect to the custom port of `2220`.


## **Reflections:**



This level taught me how to use SSH for the first time, that one step further in being comfortable with the Linux terminal. Something as simple as a login command sent me down a much bigger rabbit hole than I expected😅. I started researching SSH and ended up going all the way down to how the internet itself works. Packets, switches, routers, how data travels between machines, and how all of that builds up layer by layer to the applications we actually interact with. The OSI networking model put a lot of this into perspective, giving structure to something that had always felt abstract to me.


I also found myself wondering whether the port we specified in the command referred to a physical port on a server, like a socket you plug a cable into, such as an ethernet port for transferring data. It turns out that while physical ports like these do exist on servers, the ports used in this challenge are virtual, logical endpoints that software uses to separate different types of traffic on the same machine. That was one of those realisations that felt small but actually cleared up a lot of confusion for me.


What struck me most was how quickly SSH became relevant outside of the challenge. Shortly after this level I started renting an EC2 instance on AWS for learning, and SSH was the first thing I needed to actually connect to it, so the knowledge translated immediately into something real. It made me realise that a lot of what Bandit is foundational.





