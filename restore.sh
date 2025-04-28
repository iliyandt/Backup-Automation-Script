#!/bin/bash

# === Variables ===
BACKUP_DIR="/home/iliyan/backup"
RESTORE_DIR="/home/iliyan/restore"


# === List available backups ===
echo "Available backups:"
ls "$BACKUP_DIR"/*.tar.gz

# === Ask for input ===
read -p "Enter the backup file name to restore: " BACKUP_FILE

# === Restore ===
mkdir -p "$RESTORE_DIR"
tar -xzf "$BACKUP_DIR/$BACKUP_FILE" -C "$RESTORE_DIR"

echo "Restoration complete."

