#!/bin/bash
#
#Script that creates a samba sharing with given parameters

echo -e "\n"

#check if user is sudo or root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then 
	echo "ha ha ha, you didn't say the magic word..."
	echo "Access Denied"
	exit;
fi

SMB_CONFIG_FILE="/etc/samba/smb.conf"

#check if smb.conf file exists
	if [ ! -e $SMB_CONFIG_FILE ]; then
		echo "samba configuration file doesn't exists!";
		echo "aborting";
		exit;
	fi

echo -e "Samba Share Configuration Wizard\n********************************"

#get the parameters

read -p "Enter Sharing Name: " sharingName
read -p "Enter Sharing Path: " sharingPath
read -p "Set permission (000 - 777):" sharingMask
read -p "Comment (leave blank if not): " sharingComment

sharingGuest=no
sharingBrowsable=yes


#resume parameters
printf "\n----------------------------------\n"
echo -e "The following Samba sharing will be add:"
echo -e "\n"
echo -e "[$sharingName]"
echo -e "path = $sharingPath"
echo -e "browsable = $sharingBrowsable"
echo -e "directory mask = $sharingMask"
echo -e "guest ok	= $sharingGuest"
echo -e "comment = $sharingComment" 

#ask for confirmation

while true; do
	printf "\n\n"
	read -p "Continue? y/n " yn
	case $yn in
		[Yy]* )
	printf "\n" >> $SMB_CONFIG_FILE
	echo "[$sharingName]" >> $SMB_CONFIG_FILE
	echo "path = $sharingPath" >> $SMB_CONFIG_FILE
	echo "comment = $sharingComment" >> $SMB_CONFIG_FILE
	echo "browsable = yes" >> $SMB_CONFIG_FILE
	echo "directory mask = $sharingMask" >> $SMB_CONFIG_FILE
	echo "guest ok = $sharingGuest" >> $SMB_CONFIG_FILE
	printf "\n\n"
	echo "Done"
	break;;
		[Nn]* )
			printf "\nAborted\n"
			exit
			break;;
		* )
			echo "please enter y or n"
	esac
done
