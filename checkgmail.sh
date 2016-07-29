#!/bin/bash

#read -p "Input your name in gmail: " username;
#read -p "Input your password in gmail: " password;

username='dkhunter10@gmail.com'
password='Timmi127543Hunter127543'

echo -e "Checking for new messages... \c"

atomlines=`wget -T 3 -t 1  --secure-protocol=TLSv1 \
 --no-check-certificate \
  --user=$username --password=$password \
   https://mail.google.com/mail/feed/atom -O - \
    | wc -l`> res
    
#    echo -e "\r\c"
    echo $atomlines\n

    [ $atomlines -gt "8" ] \
     && echo -e " You have new gmail." \
      || echo -e " No new gmail."
      