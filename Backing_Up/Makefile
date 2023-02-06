dir=./Dir
interval_secs=10
max_backups=2
backupdir=./Backupdir
	
all: createDirectory runScript

createDirectory:
	@mkdir -p ./Backupdir
	@mkdir -p ./Backupdir/new
	@rm -r ./Backupdir/*

runScript:
	@./backupd.sh ${dir} ${backupdir} ${interval_secs} ${max_backups} 
