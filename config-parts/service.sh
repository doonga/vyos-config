#!/bin/vbash

# NTP server
delete service ntp allow-client
set service ntp allow-client address '127.0.0.0/8'
set service ntp allow-client address '10.0.0.0/8'
set service ntp allow-client address '172.16.0.0/12'
set service ntp allow-client address '192.168.0.0/16'
delete service ntp server
set service ntp server chronos.greyrock.io
set service ntp server 0.us.pool.ntp.org
set service ntp server 1.us.pool.ntp.org
set service ntp server 2.us.pool.ntp.org
set service ntp server 3.us.pool.ntp.org
set service ntp server 4.us.pool.ntp.org

# SSH server
set service ssh disable-password-authentication
set service ssh port '22'
