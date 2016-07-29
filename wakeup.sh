#!/bin/bash

CRON=/etc/crontab
TIME_S="*/45 * * * *"
TIME_DO="*/7 * * * *"
AUTH="root"
MSG_S="Wake up! "
MSG_DO="Continue! "
ICON="/home/dina/Pictures/icons/alarm.png"
COMMAND="notify-send -u critical -i $ICON -t 300000"
CLEAR="/root/scripts/clear_cron.sh"
MY="/home/dina/scripts/wakeup.sh"

if [[ $1 == "start" ]]
then 
	echo "y" | sudo $CLEAR alarm.png
	echo "$TIME_S $AUTH $COMMAND $MSG_S && $MY next" >> "$CRON"
else
	if [[ $1 == "next" ]]
	then 
		echo "y" | sudo "$CLEAR alarm.png"
		echo "$TIME_DO $AUTH $COMMAND $MSG_DO && $MY start" >> "$CRON"
	else
		echo "Wrang arguments"
	fi
fi
