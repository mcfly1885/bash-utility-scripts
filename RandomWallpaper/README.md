# Random Wallpaper 🖼️
The script that sets a random wallpaper image with feh

## How it works ⚙️
The script generates a random integer number that correspond to picture file name in given directory and set via feh the image as wallpaper.


## Requirements 🛠️
Make sure that on your system is installed: 
```
i3wm
feh
```

## Why this script?💡
This script is designed to set random wallpaper images on system login **to use with i3wm**


## How to use it 🚀
1. Make it executable: `chmod +x randomwallpaper.sh` 
1. Prepare a directory with your images and rename them with a 
number (1.png, 2.png,...)
1. Set in script the path to your images directory and the value of max variable, related to the number of images in the directory
1. add to your **i3wm config file** the line (where "/pat/to/" is an path placeholder example to the script file)
```
exec_always --no-startup-id /path/to/randomwallpaper.sh
```

Every time you login to i3wm, the script will set a random wallpaper image from your directory.

## Be carful! ⚠️
**Make sure that you know what are you doing**.