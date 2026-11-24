#!/bin/bash

#The script that sets a random wallpaper image with feh
#min and max rapressent the number range which are named the files in target directory (1.png, 2.png,...)
#max variable gets the total number of file in the target directory
#max value depends on how many images you want to randomize.

#setting the directory image path
directory="/path/to/images/directory/"

#set variables
min=1
max=$(find "$directory"/. -type f | wc -l)

random_num=$(( RANDOM % (max - min + 1) + min ))
feh --bg-fill $directory/$random_num.png