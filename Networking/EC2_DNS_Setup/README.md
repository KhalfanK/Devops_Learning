# EC2 + DNS Setup with NGINX

## Overview

This project demonstrates how I deployed a web server using Amazon Web Services (AWS), configured DNS using Cloudflare, and serve a webpage via NGINX on an EC2 instance.

The goal was to build a practical understanding of how domains, IP addresses, routing, and ports interact in a real-world hosting setup.

---

## What I Built

I created a working hosting setup consisting of:

- A domain (`kkhalfan.com`) purchased and managed through Cloudflare  
- A virtual server using Amazon EC2  
- An NGINX web server running on the EC2 instance  
- DNS records connecting the domain name to the server’s public IP  

When a user enters the domain in their browser, the request is resolved via DNS and routed to the EC2 instance, where NGINX serves a webpage. Seeing the default NGINX page confirmed that the full system was working correctly.

---

## What I Learnt

### DNS in Practice  
I learned how DNS maps a domain name to an IP address using A records. Configuring both root (`@`) and `www` records helped clarify how domains resolve in different cases.

### Cloud Infrastructure Basics  
Working with EC2 provided experience in:
- Launching and configuring virtual machines  
- Selecting instance types based on cost and usage  
- Managing secure access using SSH keys  

### Networking Fundamentals  
This project reinforced:
- The difference between public and private IP addresses  
- The role of ports (especially port 80 for HTTP)  
- How firewalls and security groups control traffic  

### Web Server Setup  
Installing and running NGINX helped me understand:
- How a web server listens for incoming requests  
- How HTTP traffic is handled  
- How quickly a server can be deployed and made accessible  

### End-to-End Request Flow  
I now understand the full path of a request:

**Domain → DNS → IP Address → Server → Response**

---

## Challenges and Solutions

### HTTP Not Accessible  
**Problem:** The website did not load after setting up NGINX.  
**Cause:** Port 80 was not open in the EC2 security group.  

**Solution:**  
Enabled inbound HTTP traffic in the security group settings, which allowed external access to the server.

---

### SSH Connection Issues  
**Problem:** Unable to connect to the EC2 instance via SSH.  
**Cause:** Incorrect permissions on the `.pem` key file.  

**Solution:**  
```bash
chmod 400 my_key.pem
```