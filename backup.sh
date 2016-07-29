#!/bin/bash -l
DEVPATH='/media/dina/TRANSCEND/'
OSPATH='/home/dina/pythonchik/'
LOGPATH='/var/log/backup_dina/'
ARCH=$DEVPATH'backup.tar'

DATE=`date +%F\ %T`
echo $DATE

LOG=$LOGPATH$DATE'.log'
LAST=`ls -t $LOGPATH|head -n1`
LAST=${LAST%.log}
echo $LAST

LAST=`date --date="$LAST" +"%s"`
NEW=`date --date="$DATE" +"%s"`
DELTA=$[($NEW - $LAST) / 60 / 60 / 24]
if (( $DELTA > "6" )) ; then echo "bigger" ; fi
echo $DELTA

#tar cvpf $ARCH $OSPATH
#tar tvf $ARCH > $DEVTATH'backup.log'
#cp $DEVTATH'backup.log' "$LOG"