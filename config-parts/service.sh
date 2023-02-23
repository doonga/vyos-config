#!/bin/vbash

# NTP server
delete service ntp allow-client
set service ntp allow-client address '10.0.0.0/8'
set service ntp allow-client address '172.16.0.0/12'
set service ntp allow-client address '192.168.0.0/16'
delete service ntp server
set service ntp server chronos.private.greyrock.io
set service ntp server 0.us.pool.ntp.org
set service ntp server 1.us.pool.ntp.org
set service ntp server 2.us.pool.ntp.org
set service ntp server 3.us.pool.ntp.org
set service ntp server 4.us.pool.ntp.org

# SSH server
set service ssh disable-password-authentication
set service ssh port '22'

# Cloudflare DynDNS
set service dns dynamic interface eth0 service family host-name 'ipv4.greyrock.io'
set service dns dynamic interface eth0 service family login "${SECRET_CLOUDFLARE_DYNDNS_LOGIN}"
set service dns dynamic interface eth0 service family password "${SECRET_CLOUDFLARE_DYNDNS_PASSWORD}"
set service dns dynamic interface eth0 service family protocol 'cloudflare'
set service dns dynamic interface eth0 service family server 'api.cloudflare.com/client/v4'
set service dns dynamic interface eth0 service family zone 'greyrock.io'

set service dns dynamic interface eth0 service hardware host-name 'ipv4.greyrock.tech'
set service dns dynamic interface eth0 service hardware login "${SECRET_CLOUDFLARE_DYNDNS_LOGIN}"
set service dns dynamic interface eth0 service hardware password "${SECRET_CLOUDFLARE_DYNDNS_PASSWORD}"
set service dns dynamic interface eth0 service hardware protocol 'cloudflare'
set service dns dynamic interface eth0 service hardware server 'api.cloudflare.com/client/v4'
set service dns dynamic interface eth0 service hardware zone 'greyrock.tech'
