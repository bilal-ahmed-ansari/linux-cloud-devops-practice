#!/bin/bash

echo "Hostname: $(hostname)"

echo "Date: $(date)"

echo "Uptime: $(uptime -p)"

echo "Check logged in users"
who

echo "Check running process:"
ps -ef | wc -l

echo "Zombie process" 
ps -aux | awk '$8 ~/^Z/'

systemctl is-active ssh

echo "Check internet connection"
if ping -c 2 google.com > /dev/null 2>&1
then
	echo "Internet is connected"
else
	echo "Internet is not connected"

fi


