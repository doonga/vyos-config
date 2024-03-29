#!/bin/vbash

set system domain-name 'greyrock.io'
set system host-name 'gateway'

set system login user vyos authentication public-keys personal key 'AAAAC3NzaC1lZDI1NTE5AAAAILt+39KiHG0k5C4u/r+SZp14QZjzJGYwMxh+swzjZUEW'
set system login user vyos authentication public-keys personal type 'ssh-ed25519'

set system name-server '1.1.1.1'

set system sysctl parameter kernel.pty.max value '24000'
set system sysctl parameter net.core.default_qdisc value 'fq'
set system sysctl parameter net.ipv4.tcp_congestion_control value 'bbr'

set system syslog global facility all level info
set system syslog host 10.45.0.2 facility kern level 'warning'
set system syslog host 10.45.0.2 protocol 'tcp'
set system syslog host 10.45.0.2 port '6001'
set system syslog host 10.45.0.2 format octet-counted

set system static-host-mapping host-name gateway inet '10.1.0.1'

set system task-scheduler task backup-config crontab-spec '30 0 * * *'
set system task-scheduler task backup-config executable path '/config/scripts/task-config-backup-usb.sh'

set system time-zone 'America/New_York'

set system conntrack expect-table-size '10485760'
set system conntrack hash-size '10485760'
set system conntrack table-size '10485760'

set system ip arp table-size '32768'
set system ip multipath layer4-hashing
set system ipv6 multipath layer4-hashing
set system ipv6 neighbor table-size '32768'
