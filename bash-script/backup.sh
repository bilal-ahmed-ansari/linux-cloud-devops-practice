#!/bin/bash

SOURCE="/home/bilal-ahmed-ansari/Documents"

DEST="/backup"

DATE=$(date +%F)

if tar -czf $DEST/project-$DATE.tar.gz $SOURCE

then
	echo "Backup completed successfully"

else
	echo "Backup failed"
fi
