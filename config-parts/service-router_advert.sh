#!/bin/vbash

 # Guest VLAN

 # IoT VLAN

 # LAN

 # Servers VLAN

 # Trusted VLAN
 set service router-advert interface eth4.20 prefix ::/64 valid-lifetime '172800'

 # Wireless VLAN
 set service router-advert interface eth4.60 prefix ::/64 valid-lifetime '172800'

 # Video VLAN
