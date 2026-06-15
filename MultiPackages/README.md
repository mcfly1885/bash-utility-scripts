# Multi-packages Installation Script
The script that install the packages from a text file.

## How it works ⚙️
The scritp will install packages from a text file that contain the list of packages.

First, the script check if:
- the user has sudo privileges
- the user give a parameter
- the file given as parameter exists on given path
- the file on given path is a text file

If the user input pass the checks the script will 
- update the repositories
- get the txt file
- shows its content
- asks for confirmation to user.

If user confirm, the script will install the given list of packages.

### Warning ⚠️
This script is design for Debian based OS.

## Requirements 🛠️
Make sure that on your system is installed: 
```
xargs
```
## Why this script?💡
This script is designed to make the installation of multiple package (especially on fresh Linux OS installation) more easily.

## Hint💡
The text file can be edit by adding packages name inline or line by line:

```
package1 package2 package3...
```
or
```
package1
package2
package3
```
## How to use it 🚀
1. Make it executable: `chmod +x multi-packages.sh` 
2. Execute the script like in the following example: `./multi-packages.sh path/to/packagesList.txt`

## Be carful! ⚠️
**This script install new packages and you need to be sudo! Make sure that you know what are you doing**.