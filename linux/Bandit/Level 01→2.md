# Bandit Level 1→2 - Special Character Filenames



## **Challenge:**



The password for the next level is stored in a file called `-` located in the home directory



## **Solution:**

### 1. Relative Path Method

```bash
ls

cat ./-
```

### 2. Absolute Path Method

```bash
ls

cat /home/bandit1/-
```

### 3. Redirection

```bash
ls

cat < -
```

## **Explanation:**


The `ls` lists files in the current directory, revealing a file called `-`.

There are three main ways to go about the solution for this level. In Linux, `-` is a convention meaning stdin (standard input), so if you typed `cat -` the shell reads this as the user wants to input something - it doesn't recognise it as a filename - the terminal will wait for you to input something and print whatever you typed back to you as the stdout (standard output).


To deal with this we have to let the shell know that this is a filename.



1. The first method uses the relative path of the file, `cat ./-`, this tells the shell to print the file named `-` which is inside the current directory (denoted by `./`).


2. The second method uses the absolute path of the file, `cat /home/bandit1/-`, this tells the shell to print the file named `-` by providing the full path starting from the `root`, through the `home` directory, then the `bandit1` directory.


3. The third method uses input redirection, `cat < -` tells the shell to use the file `-` as its input, which eliminates the confusion.


## **Reflections:**


This level helped solidify my understanding of `stdin` and `stdout`. I also got more comfortable with path syntax, specifically how `./` is used to reference files in the current directory. On top of that I found out about the `-` convention in Unix systems. All the small realisations help me towards my DevOps journey and building my fundamentals.

