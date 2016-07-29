#!/bin/bash -l
LOGPATH='/var/log/backup_dina/'

DATE=`date +%F\ %T`
echo $DATE

LOG=$LOGPATH$DATE'.log'
LAST=`ls -t $LOGPATH|head -n1`
LAST=${LAST%.log}
echo $LAST

LAST=`date --date="$LAST" +"%s"`
NEW=`date --date="$DATE" +"%s"`
DELTA=$[($NEW - $LAST) / 60 / 60 / 24]
if (( $DELTA > "6" )) 
then  
	MSG="Last\ was\ $DELTA\ days\ ago\n[mytotalbackup]"
	ICON="/home/dina/Pictures/icons/Justdoit.png"
	echo "*/10 * * * * root sudo notify-send -u critical -i $ICON 'Do backup' \"$MSG\"" >> "/etc/crontab"
fi
echo $DELTA
