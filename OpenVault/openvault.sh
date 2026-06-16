#! /bin/bash

#get the envirnment variariable value
VAULT=$vault
MOUNTPOINT=$mntpoint

#check if the given arguments exist
if [[ ! -e $VAULT || ! -e $MOUNTPOINT ]]; then
	echo "Error: nothing found on give path"
	exit 1
fi
#check if existing argument are directories
if [[ ! -d $VAULT || ! -d $MOUNTPOINT ]]; then
	echo "Error: the given path is not a directory"
	exit 1
fi


echo "Opening Vault..."

gocryptfs $vault $mntpoint

if [ $? -eq 0 ]; then
	echo "Welcome to your secrets..."
	sleep 1
	cd $MOUNTPOINT
	exec bash
	exit 0
fi