#!/bin/bash

# === Variables ===
BACKUP_DIR="/home/iliyan/backup"
EMAIL="iliyan1298@icloud.com"

# === Find the newest backup file ===
LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/*.tar.gz | head -n1)

# === Send Email ===
echo "Backup file attached." | mail -s "Backup File - $(date +'%Y-%m-%d')" -A "$LATEST_BACKUP" "$EMAIL"
