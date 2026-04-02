# Bandit Level 10→11 - Base64 Decoding



## **Challenge:**



The password for the next level is stored in the file `data.txt`, which contains base64 encoded data.


## **Solution:**



```bash
base64 -d data.txt
```



## **Explanation:**


`base64` is a command that encode/decodes data, `-d` sets the method of `base64` to decode the input file `data.txt`. Since we are decoding base `base64 -d` turns the file back into its original data/text.


## **Reflections:**


When I went to research more about `base64`, I read 'encoding', which I thought had something to do with encrypting. Turns out I was wrong, encrypting is about securing data, so third parties cannot intercept data, there are all sorts of encryption techniques which I want to dive deeper in at some point in my learning.

Encoding is less about security and more about making data better prepared to travel through transport layers, as some of these layers only handle text safely, so `base64` converts binary into safe text representation. 