# Bandit Level 2→3 - --Spaces in this Filename--



## **Challenge:**



The password for the next level is stored in a file called `--spaces in this filename--` located in the home directory.



## **Solution:**

### 1\. Using quotation marks

```bash
ls

cat ./'--spaces in this filename--'

```

### 2\. Using backslashes

```bash
ls

cat ./\--spaces\ in\ this\ filename--

```

## **Explanation:**



The `ls` lists files in the current directory, revealing a file called `--spaces in this filename--`.

Similar to the previous level, the filename is confusing to the shell. If you try `cat --spaces in this filename--`, the shell thinks you are trying to use options for the `cat` command. Both solutions avoid this problem. Using quotation marks allows the shell to recognise this is a single file. Backslashes are more advanced, this is a technique called **escaping** which tells the shell to ignore the special meaning of characters and treat them literally.


## **Reflections:**

I experimented a lot in this level with what works and what doesn't for filenames. Every error message helped build my knowledge and I came to realise that error messages are one of the best ways to learn, especially for someone like me who likes to research every little thing. The escaping technique is something I had used before in Python and wondered if it carried over to Bash as well, turns out it does! Transferable skills for the win!!
