# Bandit Level 4→5 - File Types



## **Challenge:**



The password for the next level is stored in the only human-readable file in the `inhere` directory.


## **Solution:**



```bash
cd inhere
file ./*
```
```
#Output
./-file00: data
./-file01: data
./-file02: data
./-file03: data
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text
./-file08: data
./-file09: data 

```
```
cat ./-file07
```



## **Explanation:**

The `file` command outputs the type of a file, `./*` tells the shell that you want to use the `file` command for every file in the current directory, where `*` is a **wildcard** meaning match everything. From the output we can see only `-file07` uses **ASCII** characters which is human-readable. This is the file that we are searching for so we print the contents to the terminal.


## **Reflections:**


This level taught me about file types and how they make it easier to distinguish the contents of a file without actually printing them to `stdout`. Another big thing I learnt was wildcards and how much easier they make your life. I can already see how often they'll come up as I go further into Linux.

Common wildcards in bash:

`*` — matches any number of characters (including none)
`?` — matches exactly one character
`[abc]` — matches any one character listed inside the brackets
`[a-z]` — matches any one character in that range
`[!abc]` — matches any character not in the brackets

So for example:

`file*` — matches file1, filename, file itself
`file?` — matches file1, fileA but not file12
`file[0-9]` — matches file0 through file9 only





