# Cron Directory Backup with Shell Script
## Code Description

The Directory Backup Shell Script serves to copy and backup a given directory in a selected destination directory if modifications were made using a cron job. 

The directory **CronBackingUp** containing the code contains: 
 **Dir** (the directory to backup),
 **Backupdir** (the directory backups to be stored in), 
 **backup-cron.sh** (Shell script containing the backup code), 
 **MakeCronFile**  (The Makefile that will be used to run the script), 
 **directory-info.last** (Contains the last modification state of the directory **Dir**), 
 **directory-info.last** (Contains the new modification state of the directory **Dir**).

The code is simple to understand. The script file takes as input 3 parameters: dir, backupdir, and max-backups.
dir parameter provides the path for the directory we are trying to maintain backed-up. 
backupdir is the path for the directory the backup will be stored in. 
max-backups is constraint on the maximum number of backups to be present in the backupdir. 

The code starts when the _make -f MakeCronFile_ command is called, this will create the Backupdir if it didn't exist, and will clear it if it did exist. It will create a blank directory-info.last file. It will then run the backup-cron.sh by placing its cron command in the crontab. The cron job command containing the info for the frequency of execution will be appended to the crontab using a simple _echo_ command followed by a _pipe_ to _crontab -_

The script starts by retrieving the modification state of the firectory and storing it in directory-info.new. A comparison will then be made between the file directory-info.last and the file directory-info.new. 
Discrepancies will definitely exist in the first time this script runs and thus, a backup has to be made. 
For other script runs, discrepancies aren't a must to exist. If discrepancies were found, that will indicate that modifications have occured in the directory and thus, backup will be needed. 
If backup was found to be needed, another check will happen on the backups present. If it was found that the backups are equal to the max-backups parameter provided, then the oldest backup will be deleted before storing the new one.
After that check and deletion (if needed) has happened, the backup will be saved and the modification state will overwrite what's written in directory-info.last. 
The script will run in the backgroud with the frequency defined in the cron command added to the crontab.

## Prerequistes
The Makefile will run through the _make_ command. An installation will be needed to make this happen. _sudo apt install make_ will be typed in the terminal to install the make package.


## Instructions to run the backup script 
To run the backup script, copy all the contents of the directory **CronBackingUp** existing in the directory **6913-lab2** to the **home** directory. That is done as cron jobs run in home directory. In terminal, make sure that the working directory is home then type in the command _make -f MakeCronFile_. This will make the script run in the background until it is stopped. To stop the script from running, type the command _crontab -e_ to the terminal and delete the cron command that was appended from the MakeCronFile.

