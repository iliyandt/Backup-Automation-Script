#!/bin/bash

# === Variables ===
SRC="/home/iliyan/Documents"
DEST="/home/iliyan/backup"
LOG="$DEST/logs/backup.log"
ERROR_LOG="$DEST/logs/backup_error.log"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$DEST/backup-$DATE.tar.gz"

# === Create backup ===
mkdir -p "$DEST/logs"
tar -czf "$BACKUP_FILE" "$SRC" 2>>"$ERROR_LOG"

# === Verify backup ===
if [[ -f "$BACKUP_FILE" && -s "$BACKUP_FILE" ]]; then
	echo "$(date '+%Y-%m-%d %H:%M:%S') Backup successfull: $BACKUP_FILE >> $LOG"
else
	echo "$(date '+%Y-%m-%d %H:%M:%S') Backup FAILED for $SRC" >> "$ERROR_LOG"
fi

# === Cleanup old backups ===
find "$DEST" -name "*.tar.gz" -type f -mtime +30 -exec rm {} \; >> "$LOG" 2>>"$ERROR_LOG"
