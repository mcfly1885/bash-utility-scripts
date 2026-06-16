# Open Vault
The script that open an encrypted directory with **gocryptfs**.

## How it works ⚙️

The script work with **environment variabiles**.

First the script checks if:

- the variables contain an path that points to someting that exists
- the existing paths in variables points to a directory

Once the variables pass the checks the script will execute gocryptfs.

The user have to prompt his own key to decrypt the directory.

If the operation has success, the script give a success message and bring the shell to mount point path.


## Requirements 🛠️
Make sure that on your system is installed: 
```
 gocryptfs
 ```
Set environment variables in your .bashrc file
```
export vault=path/to/your/vault
export mntpoint=path/to/your/mntpoint
```
then, to make changes effective launch in your terminal
`source $HOME/.bashrc` or `bash`


## Why this script? 💡
To make more easly open encrypted directory with only one command.

## Hint 💡
If you wanto customize your environment variables, remember to update the code of the script with the new variables name.

## How to use it 🚀
1. Make it executable: `chmod +x openvault.sh` 
2. Execute the script like in the following example: `./openvault.sh`


## Be carful! ⚠️
**This script works with encrypted directories. Make sure that you always have a backup of your data and that you know what are you doing.**