#!/bin/bash -l
DEVPATH='/media/dina/My Passport/'
LOGPATH='/var/log/backup_dina/'
FOLDER=$DEVPATH'Резервное копирование-'`date +"%Y-%m-%d"`
echo "Folder is $FOLDER"
mkdir "$FOLDER" 
ARCH=$FOLDER'/linux.tar'
#echo "$ARCH"
DATE=`date +%F\ %T`
#echo $DATE

LOG=$LOGPATH$DATE'.log'

tar cpf "$ARCH" "/bin" "/sbin" && 
echo [++---{/bin, /sbin - ok}------] &&
tar pfr "$ARCH" "/dev"  &&
echo [+++--{/dev - ok}------] && 
tar pfr "$ARCH" "/etc"  &&
echo [++++-{/etc - ok}------] &&  
tar pfr "$ARCH" "/home" && 
echo [+++++{/home - ok}------] &&   
tar pfr "$ARCH" "/lib" "/lib32" "/lib64" &&
echo [+++++{/lib, /lib32, /lib64 - ok}+++---] &&  
tar pfr "$ARCH" "/opt"  &&
echo [+++++{/opt - ok}++++--] &&   
tar pfr "$ARCH" "/usr"  &&
echo [+++++{/usr - ok}+++++-] &&
tar pfr "$ARCH" "/var"  &&
echo [+++++{/var - ok}++++++] && 
tar tpf "$ARCH" > "$FOLDER/backup.log" && 
cp "$FOLDER/backup.log" "$LOG" &&
echo "done" && 
/root/scripts/clear_cron.sh "Justdoit.png"
exit   
tar tvpf "$ARCH" > "$FOLDER/backup.log" && 
cp "$FOLDER/backup.log" "$LOG" &&
echo "problem detected"
exit
echo "error"