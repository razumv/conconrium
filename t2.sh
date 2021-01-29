#!/bin/bash
#You need to add below to crontab. it will exec every 5 minutes 8 hours 7 days. after 7 days delete from cron
#*/5 05,07,09,11,13,15,17,19 * * * /home/user/concordium/t2.sh

cd /home/user/concordium/

#Below should be address not account name !!
receiver="4F8fvbZfBTsM9Aoi1WkoLawxWM4bba7qopW28orLJNfP1PD5vL"
#Below should be address not account name !!
sender="3DRttEtaofdfmtt8PnP7SsWBjN9SBFUcdRzwi3wWPj9DSXY3Rp"
pass="123456\n"
pass2="123456\n"

date=`date +%d%m%y`
#date=$(date +'%d%m%y')
date2=`date`

echo "RUN $i"
/usr/bin/expect << EOF  >> $date.log
set timeout -1
spawn concordium-client --grpc-ip  127.0.0.01 --grpc-port 10000 transaction send-gtu-encrypted --receiver "$receiver" --amount 0.1 --sender "$sender" --no-confirm
expect "Enter password for decrypting the secret encryption key:"
send -- $pass
expect "Enter password for signing key:"
send -- $pass2
expect eof
EOF
