#!/bin/vbash

set interfaces ethernet eth1 address 'dhcp'
set interfaces ethernet eth1 address 'dhcpv6'
set interfaces ethernet eth1 dhcp-options reject '192.168.100.0/24'
set interfaces ethernet eth1 dhcpv6-options pd 0 length 56
# LAN
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2 sla-id 0
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2 address 1
# SERVERS
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.10 sla-id 1
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.10 address 1
# TRUSTED
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.20 sla-id 2
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.20 address 1
# GUEST
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.30 sla-id 3
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.30 address 1
# IOT
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.40 sla-id 4
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.40 address 1
# VIDEO
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.50 sla-id 5
set interfaces ethernet eth1 dhcpv6-options pd 0 interface eth2.50 address 1
set interfaces ethernet eth1 ipv6 address autoconf
set interfaces ethernet eth1 description 'WAN'
set interfaces ethernet eth1 hw-id '24:8a:07:ed:24:a0'

set interfaces ethernet eth2 address '10.1.0.1/24'
set interfaces ethernet eth2 description 'LAN'
set interfaces ethernet eth2 hw-id '24:8a:07:ed:24:a1'
set interfaces ethernet eth2 vif 10 address '10.1.1.1/24'
set interfaces ethernet eth2 vif 10 description 'SERVERS'
set interfaces ethernet eth2 vif 20 address '10.1.2.1/24'
set interfaces ethernet eth2 vif 20 description 'TRUSTED'
set interfaces ethernet eth2 vif 30 address '192.168.2.1/24'
set interfaces ethernet eth2 vif 30 description 'GUEST'
set interfaces ethernet eth2 vif 40 address '10.1.3.1/24'
set interfaces ethernet eth2 vif 40 description 'IOT'
set interfaces ethernet eth2 vif 50 address '10.1.4.1/24'
set interfaces ethernet eth2 vif 50 description 'VIDEO'

set interfaces wireguard wg01 address '10.0.11.1/24'
set interfaces wireguard wg01 description 'WIREGUARD'
set interfaces wireguard wg01 peer iphone-todd allowed-ips '10.0.11.2/32'
set interfaces wireguard wg01 peer iphone-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer iphone-todd public-key 'Nra9xTkUYNynIZvjAurDkYDaDOSVeb/COgmzcxRmHio='
set interfaces wireguard wg01 peer laptop-todd allowed-ips '10.0.11.3/32'
set interfaces wireguard wg01 peer laptop-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer laptop-todd public-key '/BSzNbCjmGzGtS8/3ojM3l+fL1IKLBgOhd3Gt9JQbjM='
set interfaces wireguard wg01 peer surface-todd allowed-ips '10.0.11.4/32'
set interfaces wireguard wg01 peer surface-todd persistent-keepalive '15'
set interfaces wireguard wg01 peer surface-todd public-key 'oxotcOxhFjrZ+22acUD8C+11avaOEgWYpAknAstUXB8='
set interfaces wireguard wg01 port '51820'
set interfaces wireguard wg01 private-key "${SECRET_WIREGUARD_PRIVATE_KEY}"

