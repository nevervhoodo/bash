#!/bin/bash -l
DEVPATH='/media/dina/My Passport/'
LOGPATH='/var/log/backup_dina/'
ARCH=$DEVPATH'Резервное копирование-'`date +"%Y-%m-%d"`
mkdir "$ARCH" 
ARCH=$ARCH'/linux.tar'
echo "$ARCH"
DATE=`date +%F\ %T`
echo $DATE

LOG=$LOGPATH$DATE'.log'

tar cvpf "$ARCH" "/*bin"
echo [++---{/bin, /sbin - ok}------] 
tar cvpf "$ARCH" "/dev"
echo [+++--{/dev - ok}------]
tar cvpf "$ARCH" "/etc"
echo [++++-{/etc - ok}------]  
tar cvpf "$ARCH" "/home"
echo [+++++{/home - ok}------]  
tar cvpf "$ARCH" "/lib*"
echo [+++++{/lib, /lib32, /lib64 - ok}+++---]  
tar cvpf "$ARCH" "/opt"
echo [+++++{/opt - ok}++++--]  
tar cvpf "$ARCH" "/usr"
echo [+++++{/usr - ok}+++++-]
tar cvpf "$ARCH" "/var"
echo [+++++{/var - ok}++++++]
tar tvpf "$ARCH" > $DEVPATH'backup.log'
cp $DEVPATH'backup.log' "$LOG"
echo completed
