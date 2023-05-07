#!/bin/vbash

# Guest VLAN

# IoT VLAN

# LAN
set service router-advert interface eth2 prefix ::/64 valid-lifetime '172800'

# Servers VLAN

# Trusted VLAN
set service router-advert interface eth2.20 prefix ::/64 valid-lifetime '172800'

# Video VLAN

# VoIP VLAN
