# Bandit Level 9→10 - Strings



## **Challenge:**



The password for the next level is stored in the file `data.txt` in one of the few human-readable strings, preceded by several ‘=’ characters.


## **Solution:**



```bash
strings data.txt | grep '====='
```

```
#Output
========== the
========== password
E========== is
H========== FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```


## **Explanation:**

The `strings` command extracts only human-readable sequences from a file, stripping out all binary data. This is piped into `grep` which filters for lines containing `=====`, matching the format described in the challenge. The output reveals four lines, the last of which contains the password preceded by the `=` characters mentioned in the challenge description.



## **Reflections:**


Through experimentation, I found that `grep` doesn't like to work with binaries, the `stderr` kept saying 'binary matched', I thought "great, a match" but was confused why that match wasn't being displayed to me. I turned to my trusty `man`, and found that `grep` doesn't output binaries by default, as we don't know what's in the binaries and could contain escape sequences. In order to override the default setting `grep -a` can be used if displaying binaries is a necessity. `strings` meant that I didn't have to worry about binaries, because its job is to get rid of them.