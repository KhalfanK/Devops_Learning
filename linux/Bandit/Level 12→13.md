# Bandit Level 12→13 - Hexdump then decompress



## **Challenge:**



The password for the next level is stored in the file `data.txt`, which is a **hexdump** of a file that has been repeatedly compressed. For this level it may be useful to create a directory under `/tmp` in which you can work.


## **Solution:**

```bash
#setup
mkdir -p /tmp/kktmp
cp data.txt /tmp/kktmp/
cd /tmp/kktmp/
```

| Step | Command |Output File Type |
|------|---------|-----------------|
| 1 | `xxd -r data.txt > data1.bin` | gzip |
| 2 | `zcat data1.bin > data2.bin` | bzip2 |
| 3 | `bzcat data2.bin > data3.bin` | gzip |
| 4 | `zcat data3.bin > data4.bin` | tar |
| 5 | `tar -xvf data4.bin` | tar |
| 6 | `tar -xvf data5.bin` | bzip2 |
| 7 | `bzcat data6.bin > data7.bin` | tar |
| 8 | `tar -xvf data7.bin` | gzip |
| 9 | `zcat data8.bin > data9.bin` | ASCII text |




## **Explanation:**

**Setup:**
`mkdir -p /tmp/kktmp`, this creates a new directory in the `/tmp` folder called `kktmp`, the `-p` flag lets the shell know that if there happens to already be a directory in the path we specified,  don't throw an error.

`cp data.txt /tmp/kktmp/` then copies the data file to that directory.

The reason we need to create a new directory is because in the `home` directory we don't have the file permissions necessary to write new files, which we will be doing when we want to decompress the file.

`cd /tmp/kktmp/` changes the directory to the one we just created.

**Table of execution:**

In the solutions section you can see a table of the steps we took to get to the password. Each step includes the command to convert a file, and the file type of the output, we got from using `file FILENAME.bin'.

We are told the `data.txt` file is a **hexdump**, that means it is human-readable hexadecimal format of an original binary file. 

In the first step we reverse the **hexdump** to a binary file using, `xxd -r data.txt` and redirect `>` it into a new file called `data1.bin`. The file type of `data1.bin` is 'gzip', this is a type of compressed file.

We are told that the file has been compressed many times, our goal is to decompress the file multiple times until we find the password.

In this challenge there were three types of compressed files and methods to decompress them:

| File type | Decompress by |
|-----------|---------------|
|`gzip`| `zcat FILENAME.bin`|
|`bzip2`| `bzcat FILENAME.bin`|
|`tar`| `tar -xvf FILENAME.bin`|

> **Note:** `tar -xvf` flags: `-x` extract, `-v` verbose output, `-f` specifies the filename.
 

So depending on the type of file we would decompress them with the appropriate method, and then redirect `>` to a new file. So for example in after step 6 we are left with a `bzip2` file called `data6.bin`, we would the us `bzcat data6.bin` then redirect to `data7.bin`.

Solution work flow:

> Step 1: Check file type  > Step 2: Use appropriate decompression command > Step 3: Repeat step 1 & 2 until password 


## **Reflections:**


I found this challenge tough, from the actual solution itself to writing up this solution. A lot of research was needed for both steps, this level taught me a lot: hexdumps, compression tools, working in the `/tmp` folder and even formatting complex solution in markdown tables while trying to keep everything clear. Everything about this level was a new experience, which I'm grateful for as it is an opportunity to learn and grow as a DevOps engineer.

