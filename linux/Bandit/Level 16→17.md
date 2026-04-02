# Bandit Level 16→17 - Port Scanning and SSL



## **Challenge:**


The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL/TLS and which don't. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it.

## **Solution:**

```bash
nmap -p 31000-32000 localhost
#Open ports: 31046, 31518, 31691, 31960, 31790
echo "YOURPASSWORD" | openssl s_client -connect localhost:31790 -ign_eof
#Outputs RSA private key
```

## **Explanation:**
This level combines port scanning with SSL/TLS from the previous level.

**Step 1 — Scanning for open ports:**
`nmap` (Network Mapper) is a tool used to scan networks and discover open ports. The `-p 31000-32000` flag specifies the range of ports to scan, and `localhost` tells it to scan the local machine. This returned five open ports: `31046`, `31518`, `31691`, `31790`, and `31960`.

**Step 2 — Finding the SSL/TLS port:**
From the previous level we know that `openssl s_client` is used to establish SSL/TLS connections. Each open port was tested, ports that don't speak SSL/TLS either error or echo back whatever you send them. Port `31790` was the only one that accepted the SSL/TLS connection and validated the password.

A quirk worth noting, entering the password manually caused `KEYUPDATE` noise to appear, interfering with the output. The fix is to pipe the password directly into `openssl` using `echo` and add the `-ign_eof` flag:


```bash
echo "YOURPASSWORD" | openssl s_client -connect localhost:31790 -ign_eof
```

`-ign_eof` stands for **ignore end of file** — without it, OpenSSL closes the connection as soon as input ends, before the server has a chance to respond. With it, the connection stays open long enough to receive the RSA private key.

The result this time is not a password but an RSA private key, which will be used in the same way as the previous SSH key level.

## **Reflections:**
This level tied together a lot of concepts from previous levels, SSL/TLS from level 15, RSA keys from level 13, and introduced port scanning for the first time. `nmap` felt like a natural tool once I understood what I was looking for, the hardest part was the `KEYUPDATE` issue which sent me researching the `-ign_eof` flag. It's a good example of how a small flag can be the difference between a working solution and a broken one.