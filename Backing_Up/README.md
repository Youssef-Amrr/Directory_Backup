# Directory Backup with Shell Script
## Code Description

The Directory Backup Shell Script serves to copy and backup a given directory in a selected destination directory if modifications were made. 

The directory **BackingUp** containing the code contains: 
 **Dir** (the directory to backup),
 **Backupdir** (the directory backups to be stored in), 
 **backupd.sh** (Shell script containing the backup code), 
 **Makefile**  (Used to run the script), 
 **directory-info.last** (Contains the last modification state of the directory **Dir**), 
 **directory-info.last** (Contains the new modification state of the directory **Dir**).

The code is simple to understand. The script file takes as input 4 parameters: dir, backupdir, interval-secs, and max-backups.
dir parameter provides the path for the directory we are trying to maintain backed-up. 
backupdir is the path for the directory the backup will be stored in. 
interval-secs determines the waiting period before checking if modifications were made in the dir. 
max-backups is constraint on the maximum number of backups to be present in the backupdir. 

The code starts when the _make_ command is called, this will create the Backupdir if it didn't exist, and will clear it if it did exist.
It will then run the backupd.sh script passing the hard-coded arguments that existed in the Makefile.
The shell script starts by intially backing-up the dir (Initial Backup).The state for the dir will then be stored in a file named directory-info.last. 
After the sleeping period (interval-secs), the state for the dir will be retrieved and stored in another file named directory-info.new. Both directory-info files will be compared to find discrepancies.
If discrepancies were found, that will indicate that modifications have occured in the directory and thus, backup will be needed. Else, sleeping for the interval-secs will happen. If backup was found to be needed, another check will happen on the backups present. If it was found that the backups are equal to the max-backups parameter provided, then the oldest backup will be deleted before storing the new one.
After that check and deletion (if needed) has happened, the backup will be saved and the modification state will overwrite what's written in directory-info.last. All these commands exist in an infinite loop to guarantee that backup will be maintained throughout the life of the program. 


## Prerequistes
The Makefile will run through the _make_ command. An installation will be needed to make this happen. _sudo apt install make_ will be typed in the terminal to install the make package.


## Instructions to run the backup script 
To run the backup script, simply change the directory to the directory containing the code.
If the provided folder was stored at home for user youssef, then changing the directory will happen with this command _cd /home/youssef/6913-lab2/BackingUp_. After changing the directory, _make_ command will be called and the program will then run. 
Program exists in an infinite loop. To stop its execution, type Ctrl + C in the terminal. 
