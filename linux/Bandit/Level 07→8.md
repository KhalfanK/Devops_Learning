# Bandit Level 7→8 - Searching using grep



## **Challenge:**



The password for the next level is stored in the file `data.txt` next to the word **millionth**.


## **Solution:**



```bash
ls
#Outputs a single file called data.txt

grep millionth data.txt
#Outputs line starting with millionth which includes password at the end
```


## **Explanation:**


`ls` command is used to list the files in the directory which reveals `data.txt`. `grep` is used to match the pattern `millionth` which searches line by line through the file and returns any line containing that pattern



## **Reflections:**


I originally used `cat` on the file, and to my shock the terminal kept going and going. The file was huge so I had to terminate the process using `ctrl C`, something I had learnt before. I then used the `du -ah` command just to see how big it actually was, it was 4 Megabytes of line after line. Maybe I should get in the habit of checking file sizes before using `cat`.

Another thing is I could've made the command more robust by making it case insensitive by using `grep -i`, I took the level goal description at face value which didn't affect my solution this time, but going forward I want to make sure I think about different edge case scenarios that could throw off my solution. 
