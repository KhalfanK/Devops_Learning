# Bandit Level 11→12 - ROT13




## **Challenge:**



The password for the next level is stored in the file `data.txt`, where all lowercase **(a-z)** and uppercase **(A-Z)** letters have been rotated by 13 positions.



## **Solution:**



```bash
cat data.txt | tr [A-Ma-mN-Zn-z] [N-Zn-zA-Ma-m]
```

## **Explanation:**


This level introduces ROT13, a simple substitution cipher where every letter is shifted by 13 positions in the alphabet. Since the alphabet has 26 letters, applying ROT13 twice returns you to the original text, it is its own inverse.

The `tr` command translates characters using a 1:1 map, every character in the first array is substituted with the corresponding character in the second array. The mapping was built manually to reflect the ROT13 shift:


```
Array 1: A-M a-m N-Z n-z
Array 2: N-Z n-z A-M a-m
```

So `A` becomes `N`, `B` becomes `O`, and so on — shifted by exactly 13 positions for both uppercase and lowercase.

`tr` only reads from stdin and doesn't accept filenames as arguments, which is why the file is piped into it using `cat`. An alternative is to use input redirection, skipping the `cat` process entirely:


```bash
tr [A-Ma-mN-Zn-z] [N-Zn-zA-Ma-m] < data.txt
```

## **Reflections:**


This one took me longer than expected, not because I didn't understand what needed to be done, but because knowing what to achieve and knowing how to use your tools to achieve it are two different things. Once I researched ROT13 and understood the 13 position shift, I had to figure out how to replicate that manually using `tr`. Building the character map myself meant I actually understood the mechanics rather than just running a decode command.

It also reinforced something from earlier levels, `tr` only accepts stdin, which is why the pipe was necessary. A good reminder that understanding *why* a command is structured the way it is matters as much as knowing the command itself.