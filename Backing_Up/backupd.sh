#!/bin/bash
if [ $# -ne 4 ]
then 
	echo "Error in arguments passed"
else
	dir=$1
	backupdir=$2
	interval_secs=$3
	max_backups=$4
	dateNow=$(date "+%Y-%m-%d-%H-%M-%S")
	#INITIAL BACKING UP WITHOUT CHECKING WHETHER DIRECTORIES CHANGED OR NOT
	mkdir $backupdir/$dateNow
	cp -r $dir/* $backupdir/$dateNow
	ls -lR $dir > directory-info.last
	while true
	do
		sleep $interval_secs
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
 			backups=$(( $backups + 1 ))
 			cp ./directory-info.new ./directory-info.last
 		fi
	done

fi
