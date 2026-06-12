# USB Device Disconnector 🔌
The script that safely disconnect a USB drive.

## How it works ⚙️

The script accepts as parameter the name of mount point like `sdX` and starts showing the selected device and it's mounted partition(s) and asks user for confirmation.

If user confirm, the script will unmount all mounted partitions, will power off the device and gives to user a success message.

The script works only with USB device.

### ⚠️ Warning ⚠️
Use this script **only** for usb drive! Using this script on multiple-drive-in-1 card reader **IS NOT RECOMMENDED** due of known issue: by powering off card reader makes it not operational and you have to reboot your system to powering on it again.

## Requirements 🛠️
Make sure that on your system is installed: 
```
lsblk
udisks2
```
## Parameters 📋

|Parameter|Description|
|---------|-----------|
|-d| The name of device `example: sdX`


## Why this script?💡
This script is designed to make more easily disconnect a USB drive on system that doesn't have GUI or for those who work primarily on terminal.

## Hint 💡
Before run the script, run `lsblk` to identify the device that you want to unmount and power off.

## How to use it 🚀
1. Make it executable: `chmod +x device-disconnection.sh` 
2. Execute the script like in the following example: `./device-disconnection.sh -d sdX`



## Be carful! ⚠️
**This script work with physical drives! Make sure that you know what are you doing**.
