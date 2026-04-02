# Bandit Level 15→16 - SSL/TLS



## **Challenge:**



The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption.


## **Solution:**

```bash
openssl s_client localhost:30001
#when prompted enter password for bandit15
```



## **Explanation:**

This level is similar to the previous, the difference being the protocol that we use to connect to the port. `openSSL` provides a secure connection using `SSL` (Secure Sockets Layer) or `TLS`(Transport Layer Security).

Note: SSL is actually deprecated and TLS is its successor. Most thing that say SSL today actually use TLS.

The `s_client` part of the command is a method that establishes that SSL/TLS connection when given the name of the host server and port. The format is similar to `nc`.

The listening port validates the input you give it as the correct password, and responds with the next password.


## **Reflections:**


I find it interesting how networking tools share similar interfaces, the way you pass a host and port to `openssl` feels familiar from `nc`. I think this is intentional, a lot of networking tooling is designed around consistent patterns so engineers can move between protocols without having to relearn everything from scratch. Consistency at the interface level is what makes complex infrastructure manageable




