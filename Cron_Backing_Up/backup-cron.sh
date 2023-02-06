#!/bin/bash
if [ $# -ne 3 ]
then 
	echo "Error in arguments passed"
else
	dir=$1
	backupdir=$2
	max_backups=$3
	dateNow=$(date "+%Y-%m-%d-%H-%M-%S")
	ls -lR $dir > directory-info.new
	diff ./directory-info.last ./directory-info.new > /dev/null 2>&1
	diffs=$?
 	if [ $diffs -eq 1 ] #CHANGES HAPPENED. NEED TO BACKUP.
 	then 
 		backups=$(ls $backupdir | wc -l)
 		if [ $backups -eq $max_backups ]
 		then 
 			directoryToBeDeleted=$(find $backupdir/* -type d | sort | head -n 1)
 			rm -r $directoryToBeDeleted
 		fi
 		dateNow=$(date "+%Y-%m-%d-%H-%M-%S")
 		mkdir $backupdir/$dateNow
 		cp -r $dir/* $backupdir/$dateNow
 		cp ./directory-info.new ./directory-info.last
 	fi
fi
