#!/bin/vbash

# BGP configuration
set protocols bgp neighbor 10.1.1.4 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.4 description 'k8s1'
set protocols bgp neighbor 10.1.1.4 remote-as '64512'
set protocols bgp neighbor 10.1.1.5 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.5 description 'k8s2'
set protocols bgp neighbor 10.1.1.5 remote-as '64512'
set protocols bgp neighbor 10.1.1.6 address-family ipv4-unicast
set protocols bgp neighbor 10.1.1.6 description 'k8s3'
set protocols bgp neighbor 10.1.1.6 remote-as '64512'
set protocols bgp parameters router-id '10.1.0.1'
set protocols bgp system-as '64512'
