#!/bin/bash
usage(){
    echo "device-disconnect -m sdX"
}

while getopts "d:" opt; do
    case $opt in
        d)
            MOUNTPOINT="/dev/$OPTARG"
            DEVICE=$OPTARG
			;;
        \?) 
            usage
			exit 1
            ;;
        *)
            usage
			exit 1
            ;;
        :)
			echo "Flag -$OPTARG require an argument."
			exit 1
			;;       
    esac
done


#check if there is a input parameter
if [[ $# -eq 0 ]]; then
	echo "Error: no argument given!"
	exit 1
fi

#check if given mount point dosent exist
if [[ ! -e $MOUNTPOINT ]]; then
    echo "Device $MOUNTPOINT doesnt not exist"
    echo "aborting"
    exit 1    
fi
#check if the given device is not a usb
devtype=$(lsblk -ndo tran $MOUNTPOINT)
if [[ $devtype != "usb" ]]; then #check if the given device is not usb type.
    echo "Device type mismatch ($devtype)"
    echo "aborting"
    exit 1
fi
if [[ ! -b $MOUNTPOINT ]]; then #check if is a block special file
    echo "$MOUNTPOINT is not a valid entry"
    echo "aborting"
    exit 1    
fi

echo -e "Device Selected:\n$(lsblk -do name,model,tran | grep $DEVICE)"
lsblk | grep $DEVICE
echo "----------------------------------------------------"
#ask confirmation
while true; do
    read -p "Are you sure you want to disconnect $MOUNTPOINT? (y/n) >> " yn
     case $yn in
        y|Y) 
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

 for montpoint in $MOUNTPOINT*; do
    udisksctl unmount -b "$montpoint" 2>/dev/null
 done
    udisksctl power-off -b $MOUNTPOINT


echo "Device can now be safely removed"
exit 0