#!/bin/bash

#The script that sets a random wallpaper image with feh
#min and max rapressent the number range which are named the files in target directory (1.png, 2.png,...)
#max value depends on how many images you want to randomize.

min=1
max=10
random_num=$(( RANDOM % (max - min + 1) + min ))

#setting the directory image path
feh --bg-fill /path/to/images/directory/$random_num.png