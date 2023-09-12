#!/bin/bash
#
# Description: Backup config directory and configuration commands to a USB device
#

dest="/media/usb-backup"
disk="/dev/disk/by-id/usb-SanDisk_Cruzer_Fit_4C530102060809112300-0:0-part1"
user="vyos"

# Mount a formatted exfat USB
if ! findmnt -M "${dest}"; then
    sudo mkdir -p "${dest}"
    sudo mount.exfat-fuse -o "rw,uid=${user},gid=vyattacfg" "${disk}" "${dest}"
fi

# Backup
if findmnt -M "${dest}"; then
    timestamp="$(date +%Y%m%d%H%M%S)"

    # VyOS Commands
    mkdir -p "${dest}/vyos/"
    /opt/vyatta/bin/vyatta-op-cmd-wrapper show configuration commands | gzip -3 -c > "${dest}/vyos/vyos-commands.${timestamp}.gz"

    # VyOS /config
    tar --exclude="overlay*" -zvcf "${dest}/vyos/vyos-config.${timestamp}.tar.gz" /config

    # Delete backups older than 1 month
    find "${dest}" -type f -mtime +30 -delete

    # Sync the filesystem
    sync
    # Unmount the USB drive
    sudo umount "${dest}"
fi
