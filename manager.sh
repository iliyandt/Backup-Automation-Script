#!/bin/bash

# === Variables ===
BACKUP_SCRIPT="/home/iliyan/backup/backup.sh"
RESTORE_SCRIPT="/home/iliyan/backup/restore.sh"

# === Menu ===
clear
echo "==== Backup and Restore Manager ===="
echo "1) Create a Backup"
echo "2) Restore from Backup"
echo "3) Exit"
echo "====================================="

# === Get user choice ===
read -p "Choose an option [1-3]: " choice

# === Execute based on choice ===
case $choice in
    1)
        bash "$BACKUP_SCRIPT"
        ;;
    2)
        bash "$RESTORE_SCRIPT"
        ;;
    3)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

