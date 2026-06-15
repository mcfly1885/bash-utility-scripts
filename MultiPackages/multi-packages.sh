#!/bin/bash

#check if user is sudo or root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then 
	echo "ha ha ha, you didn't say the magic word..."
	echo "Access Denied"
	exit 1;
fi

#check if there is a input parameter
if [[ $# -eq 0 ]]; then
	echo "Error: no argument given!"
	exit 1
fi

#check if file exists
if [[ -e $1 ]]; then 
    file=$( file --mime-type $1 | awk '{print $2}' ) #get the file mime type
else
    echo "The given file does not exist!"
    echo "aborting"
    exit 1
fi

# check if file is not a text file
if [[ $file != "text/plain" ]]; then 
	echo "Error: file path is not a text file" 
	exit 1	
fi

echo -e "\n **Update reposisoties**\n"
sudo apt update

echo -e "\n Packages list\n"

cat $1

echo -e "\n"
#ask confirmation
while true; do
    read -p "Are you sure you want to install this packages? (y/n) >> " yn
     case $yn in
        y|Y) 
            echo -e "\n**Install packages**\n"
            sudo  xargs -a $1 apt install 
            break
            ;;
        n|N) 
            echo "Aborting"
            exit 0
            ;;
        *) echo "Pleas enter y or n"
        ;;
    esac
done

exit 0