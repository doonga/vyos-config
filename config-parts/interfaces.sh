#!/bin/vbash

set interfaces ethernet eth4 address 'dhcp'
set interfaces ethernet eth4 description 'WAN'
set interfaces ethernet eth4 hw-id '68:05:ca:39:a4:e4'

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

set interfaces wireguard wg01 address '10.0.11.1/24'
set interfaces wireguard wg01 description 'WIREGUARD'
set interfaces wireguard wg01 peer ipad-todd allowed-ips '10.0.11.3/32'
set interfaces wireguard wg01 peer ipad-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer ipad-todd public-key 'tyxACMBFCXxJZ8AdrHfXAI+lhueC7Msrj0s/DCNnXgs='
set interfaces wireguard wg01 peer iphone-todd allowed-ips '10.0.11.2/32'
set interfaces wireguard wg01 peer iphone-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer iphone-todd public-key 'Nra9xTkUYNynIZvjAurDkYDaDOSVeb/COgmzcxRmHio='
set interfaces wireguard wg01 peer macbook-todd allowed-ips '10.0.11.4/32'
set interfaces wireguard wg01 peer macbook-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer macbook-todd public-key '/NCWOUGrjcspzfwMraFKHUu40lXbxX0Rt7baosoM+Do='
set interfaces wireguard wg01 port '51820'
set interfaces wireguard wg01 private-key "${SECRET_WIREGUARD_PRIVATE_KEY}"

