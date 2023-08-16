#!/bin/vbash

set interfaces ethernet eth4 address 'dhcp'
set interfaces ethernet eth4 address 'dhcpv6'
set interfaces ethernet eth4 description 'WAN'
set interfaces ethernet eth4 hw-id '68:05:ca:39:a4:e4'
set interfaces ethernet eth4 dhcp-options reject '192.168.100.0/24'
set interfaces ethernet eth4 dhcpv6-options pd 0 length 56
set interfaces ethernet eth4 dhcpv6-options pd 0 interface eth5.20 sla-id 2
set interfaces ethernet eth4 dhcpv6-options pd 0 interface eth5.20 address 1
set interfaces ethernet eth4 dhcpv6-options pd 0 interface eth5.60 sla-id 6
set interfaces ethernet eth4 dhcpv6-options pd 0 interface eth5.60 address 1
set interfaces ethernet eth4 ipv6 address autoconf

set interfaces ethernet eth5 address '10.1.0.1/24'
set interfaces ethernet eth5 description 'LAN'
set interfaces ethernet eth5 hw-id '68:05:ca:39:a4:e5'
set interfaces ethernet eth5 vif 10 address '10.1.1.1/24'
set interfaces ethernet eth5 vif 10 description 'SERVERS'
set interfaces ethernet eth5 vif 20 address '10.1.2.1/24'
set interfaces ethernet eth5 vif 20 description 'TRUSTED'
set interfaces ethernet eth5 vif 30 address '192.168.2.1/24'
set interfaces ethernet eth5 vif 30 description 'GUEST'
set interfaces ethernet eth5 vif 40 address '10.1.3.1/24'
set interfaces ethernet eth5 vif 40 description 'IOT'
set interfaces ethernet eth5 vif 50 address '10.1.4.1/24'
set interfaces ethernet eth5 vif 50 description 'VIDEO'
set interfaces ethernet eth5 vif 60 address '10.1.5.1/24'
set interfaces ethernet eth5 vif 60 description 'WIRELESS'

set interfaces wireguard wg01 address '10.0.11.1/24'
set interfaces wireguard wg01 description 'WIREGUARD'
set interfaces wireguard wg01 peer iphone-todd allowed-ips '10.0.11.2/32'
set interfaces wireguard wg01 peer iphone-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer iphone-todd public-key 'Nra9xTkUYNynIZvjAurDkYDaDOSVeb/COgmzcxRmHio='
set interfaces wireguard wg01 peer macbook-todd allowed-ips '10.0.11.3/32'
set interfaces wireguard wg01 peer macbook-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer macbook-todd public-key 'WGo0C+dK8IeCN6jJhuCUFGlSda0oh+Jjh/AMACrlYSw='
set interfaces wireguard wg01 peer ipad-todd allowed-ips '10.0.11.4/32'
set interfaces wireguard wg01 peer ipad-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer ipad-todd public-key 'Ph2TMWzVtGzRnMTR3VxupiSZK2yZE+4PNTFJKzb3pyM='
set interfaces wireguard wg01 port '51820'
set interfaces wireguard wg01 private-key "${SECRET_WIREGUARD_PRIVATE_KEY}"

