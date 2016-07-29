#!/bin/bash
STR='notify-send -u critical Hey'
FILE="/etc/crontab"

deleting ()
{	
	echo "func"
	N=`grep "$STR" "$FILE" -c`
	echo "found $N times"
	while (( "$N" > 0 ))
	do
		TRY=`cat "$FILE"|grep "$STR"`
		#TRY=`cat $FILE|grep "$STR"`
		echo "delete string: "
		echo "$TRY?"
		read ANS
		if [[ "$ANS" = "y" ]] 
		then 
			#cat "$FILE"|grep -v "$TRY" > "$FILE"
			`sed -i "/$STR/d" "$FILE"` 
			echo did
		else	break
		fi
		N=`grep "$STR" "$FILE" -c` 
		echo $N
	done
}

if (($#>0)) 
then echo yes
	for PAR in $@
	
	#DELETED=0
	#while (($DELETED < $#))
	do
		#let "DELETED = $DELETED + 1"
		STR=$PAR
		echo "My str is $STR"
		deleting
	done
else
	deleting
fi
