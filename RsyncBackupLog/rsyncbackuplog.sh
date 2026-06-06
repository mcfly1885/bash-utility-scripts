#!/bin/bash
 usage(){
    echo "Usage: -s [source path file or directory] -d [destination path] -l [log file path] -q quite, no log file will be use"
	exit 1
 }
QUIET="false"
while getopts "s:d:l:q" opt; do
    case $opt in
        s)
            SOURCE="$OPTARG"
            ;;
        d)
            DESTINATION="$OPTARG"
            ;;
		l)
			LOG_PATH="$OPTARG"
			;;
		q)
			LOG_PATH="/dev/null"
			QUIET="true"
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

shift $((OPTIND - 1))

#---LOGFILE--check--------------------------------------------------------
if [ "$QUIET" != "true" ]; then #if quiet mode is not set
	if [ -z "$LOG_PATH" ]; then #if a path has not been defined
		echo "Error: log file path is not defined" 
		usage
		exit 1
	else
		if [ -e "$LOG_PATH" ]; then #if something exist on path
			if [ ! -f "$LOG_PATH" ]; then #if what exists is not equal to a file
				echo "Error: log path is not a file" 
				exit 1
			else
				file=$( file --mime-type $LOG_PATH | awk '{print $2}' )
				if [ $file != "text/plain" ]; then #if file is not a text file
					echo "Error: log path is not a text file" 
					exit 1	
				fi
			fi
		else #if nothing exists on given path create a log file and add a line with warning message
			touch $LOG_PATH
			date +"[*] %d/%m/%Y %T [WARNING] Log file not found, created new one " >> $LOG_PATH
		fi
	fi
fi
#---SOURCE--check--------------------------------------------------------

#if source path is not defined
if [ -z "$SOURCE" ]; then
	date +"[*] %d/%m/%Y %T [ERROR] Source file or directory path is not defined " >> $LOG_PATH
	exit 1
fi

#---DESTINATION--check--------------------------------------------------------
#if destination path is not defined
if [ -z "$DESTINATION" ]; then
	date +"[*] %d/%m/%Y %T [ERROR] Destionation file or directory path is not defined " >> $LOG_PATH
	exit 1
else
	#if destination does not exist
	if [ ! -e $DESTINATION ]; then
		date +"[*] %d/%m/%Y %T [ERROR] Destionation directory $(realpath $DESTINATION) does not exist " >> $LOG_PATH
		exit 1
	elif [ ! -d $DESTINATION ]; then #if destination is not a directory
		date +"[*] %d/%m/%Y %T [ERROR] Destionation directory $(realpath $DESTINATION) is not a directory " >> $LOG_PATH
		exit 1
	fi
fi

#---RUN-backup--------------------------------------------------------------------------------------------------------------------
#if source extists
if [ -e $SOURCE ]; then
	if [ -h $SOURCE ]; then
		rsync -L $SOURCE --mkpath $DESTINATION""$SOURCE
		date +"[*] %d/%m/%Y %T [INFO] Backup of data at symlink-->$(realpath $SOURCE) on $(realpath $DESTINATION) executed" >> $LOG_PATH		
	elif [ -f $SOURCE ]; then
		rsync $SOURCE $DESTINATION	
		date +"[*] %d/%m/%Y %T [INFO] Backup of file $(realpath $SOURCE) on $(realpath $DESTINATION) executed" >> $LOG_PATH
	elif [ -d $SOURCE ]; then
		rsync -r $SOURCE --mkpath $DESTINATION""$SOURCE
		date +"[*] %d/%m/%Y %T [INFO] Backup of directory $(realpath $SOURCE) on $(realpath $DESTINATION) executed" >> $LOG_PATH
	fi
else
	date +"[*] %d/%m/%Y %T [ERROR] Source file or directory $(realpath $SOURCE) does not exist " >> $LOG_PATH
	exit 1
fi