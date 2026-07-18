#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi


LOG_DIR=$1

ARCHIVE_DIR="/archives"

mkdir -p $ARCHIVE_DIR


TIMESTAMP=$(date +"%Y%m%d_%H%M%S")


ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"


tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOG_DIR"


echo "Archive created: $ARCHIVE_NAME at $(date)" >> /archives/archive.log


echo "Completed:"
echo "/archives/$ARCHIVE_NAME"