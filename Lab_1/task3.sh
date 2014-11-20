#!/bin/bash 
while [ %M != '00' ]; 
do
date +"%m/%d/%y %H:%M:%S" >> ~/date.txt
sleep 60
done


Содержимое crontab:
  0-59 19 20 11 3 sh ~/script.sh




