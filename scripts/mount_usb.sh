#!/bin/bash
 #
 # Description: Backup VyOS configuration to a USB device
 #
 dest="/media/usb-backup"
 disk="/dev/disk/by-id/usb-USB_SanDisk_3.2Gen1_0901720a98e1773fd9158c13f82973a77e45e95e91d299fccd89743ca3dc1388d3f1000000000000000000007c9ca6c6ff82672081558107612ef6b8-0:0-part1"

 user="vyos"

 # Mount a formatted exfat USB
 if ! findmnt -M "${dest}"; then
     sudo mkdir -p "${dest}"
     sudo mount.exfat-fuse -o "rw,uid=${user},gid=vyattacfg" "${disk}" "${dest}"
 fi
