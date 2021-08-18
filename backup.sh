#! /bin/bash


# Find command look for .gz files inside /var/log with recursive way and then copying it to
# /home/ubuntu/task4/Backup folder and this command also look for subdirectories

sudo find /var/log -type f -name "*.gz" -exec cp {} /home/ubuntu/task4/Backup \;

# Compress the folder with foldername + date and take backup
filename="backup_`date +%Y`_`date +%m`_`date +%d`.tar.gz";

# Create compressed file using tar with gzip and move to backup folder
# For restore use the following command and move or copy to /var/log
# tar -xvf archive.tar.gz -C /home/ubuntu/task4/Backup

sudo tar -czvf /home/ubuntu/task4/$filename /home/ubuntu/task4/Backup/

# tar command check .tar.gz file inside and makes a log file with YYYYMMDD date

tar -tf $filename > "backup_log_`date +%Y`_`date +%m`_`date +%d`.txt"

# bash script file also added to crontab to be executed every day at 8am
# crontab -e  ,  0 8 * * * sudo /home/ubuntu/task4/backup.sh

