#!/bin/vbash

# NTP server
delete service ntp allow-client
set service ntp allow-client address '127.0.0.0/8'
set service ntp allow-client address '10.0.0.0/8'
set service ntp allow-client address '172.16.0.0/12'
set service ntp allow-client address '192.168.0.0/16'
delete service ntp server
set service ntp server 10.1.7.2 # time1.greyrock.io
set service ntp server 10.1.7.3 # time2.greyrock.io
set service ntp server 10.1.7.4 # time3.greyrock.io
set service ntp server 10.1.7.5 # time4.greyrock.io

# SSH server
set service ssh disable-password-authentication
set service ssh port '22'

# mDNS Repeater
set service mdns repeater interface 'eth4.10'
set service mdns repeater interface 'eth4.20'
set service mdns repeater interface 'eth4.40'
set service mdns repeater interface 'eth4.60'

# TFTP server
 set service tftp-server directory '/config/tftpboot'
 set service tftp-server listen-address 10.1.1.1

# DNS forwarder
set service dns forwarding domain greyrock.io name-server 10.46.0.3
set service dns forwarding domain greyrock.casa name-server 10.46.0.3
set service dns forwarding listen-address 10.1.1.1
set service dns forwarding allow-from 10.1.1.0/24
