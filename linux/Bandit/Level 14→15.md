# Bandit Level 14→15 - TCP



## **Challenge:**



The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.


## **Solution:**

```bash
cat /etc/bandit_pass/bandit14 | nc localhost 30000
```



## **Explanation:**

We are told in the previous level that the password for **bandit14** is stored in `/etc/bandit_pass/bandit14`. `nc` stands for **netcat** which can establish `TCP` (Transmission Control Protocol) connections, and send `UDP` (User Datagram Protocol), used for sending data over networks.

The format for the `nc command`:

`nc [Hostname] [Port]`

For `nc` to work it needs an ip and port. `localhost` is a standard convention, with an ip of 127.0.0.1 by default, we are told that the port to send the password is `30000`.

The server on port 30000 is listening for input, we sent that input using the pipe `|`, validates it as the correct password, and responds with the next password.


## **Reflections:**


This felt like a big step into DevOps, working with TCP connections, ip addresses and daemons. The first real look into networking protocols via the terminal.