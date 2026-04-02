# Bandit Level 8→9 - Counting lines



## **Challenge:**



The password for the next level is stored in the file `data.txt` and is the only line of text that occurs only once.


## **Solution:**



```bash
ls
#Outputs a single file called data.txt

sort data.txt | uniq -c
```
```
#Ouput
…
10 2EFKJco5KZnbkQLj0oen5cVgbwzNioDr
10 2rTFFlUJ4KkcEGhrsi6o5QsgofP8yTyr
10 3XiARLa3d6LTJ5PYT5JCfN60VDx6FLVH
 1 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
10 66TrUQVXbVR6ULKNouQCshyInYXqTYzE
10 6Fv4fN9rP2Jd3789kWRB0alOLxXTBlo1
10 6GAXZtABu3ubAxFpTGGSNbFm97v20eb1
…

```


## **Explanation:**


`uniq` is a command that filters based on adjacent matching lines from stdin based on the flags set. To prime the `data.txt` file for the `uniq` command to run properly, `sort` is implemented so that repeated lines were adjacent, then piped to `uniq`. The `-c` or `-count` option tells the `uniq` command to prefix the matches with number of occurences, the password is the line which only has a single occurence.



## **Reflections:**


I tried using `uniq -c` without sorting and was wondering why it wasn't working. I used the `man` command and found out it only works with adjacent lines instead of anywhere in the file. This makes sense as the command would take a lot of time if it searched the whole document every time like I assumed.

