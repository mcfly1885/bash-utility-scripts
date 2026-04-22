# Samba Share Configuration Wizard 🪄
The script that creates a new samba share.

## How it works ⚙️

The scripts requires to user the following parameters:

- name of Samba share
- path to directory to share
- permissions (from 000 to 777)
- a comment

Once the paramter has been given, the script shows the resume of user entry. If user confirm, the script will write the parameters on **/etc/samba/smb.conf** file, otherwise will abort the operation.

**Make sure to restart smbd service for the changes to take effect.**

## How to use
**To use this script is needed that Samba has been installed.**

1. Make it executable   `sudo chmod +x sambasharing.sh` 
2. Execute the script   `sudo ./sambasharing.sh`
3. Restart Samba        `sudo systemctl restart smbd`

## Why this script? 💡
Because it can makes this operation faster then hand writing each parameter in smb.conf file.

## Be carful! ⚠️
**Be carful of what are you doing!** This script will edit a conf file and you need to be sudo.