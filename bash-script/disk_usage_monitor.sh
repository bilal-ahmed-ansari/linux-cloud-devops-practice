#!/bin/bash

# display disk usage information
for dir in /home /etc /var
do
	echo "Checking $dir"
	df -h $dir
done



# ------- Another program -------
# Threshold value
THRESHOLD=80

# Flag variable
warning=0

# read the output of df command
while read filesystem usage
do
	# Remove %
	usage=${usage%\%}

	# Compare usage
	if [ "$usage" -gt "$THRESHOLD" ]
	then
		echo "Warning!" 
		echo "$filesystem is ${usage}% full."
		warning=1
	fi
done < <(df -h | awk 'NR>1 {print $1, $5}')

# If no partition crosses the threshold
if [ "$warning" -eq 0 ]
then
	echo "Disk usage is normal"
fi
