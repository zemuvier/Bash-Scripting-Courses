#!/bin/bash 
while [ %M != '00' ]; 
do
date +"%m/%d/%y %H:%M:%S" >> ~/date.txt
sleep 60
done




