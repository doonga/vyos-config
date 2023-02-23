#!/bin/vbash

# General configuration
set firewall state-policy established action 'accept'
set firewall state-policy invalid action 'drop'
set firewall state-policy related action 'accept'

# Address Groups
set firewall group address-group aruba_devices address '10.1.0.2'
set firewall group address-group aruba_devices address '10.1.0.3'
set firewall group address-group aruba_devices address '10.1.0.4'
set firewall group address-group aruba_devices address '10.1.0.5'
set firewall group address-group aruba_devices address '10.1.0.6'
set firewall group address-group aruba_devices address '10.1.0.7'
set firewall group address-group aruba_devices address '10.1.0.8'

set firewall group address-group ereaders address '10.1.2.10'

set firewall group address-group homekit-devices address '10.1.2.17'
set firewall group address-group homekit-devices address '10.1.2.18'
set firewall group address-group homekit-devices address '10.1.2.19'
set firewall group address-group homekit-devices address '10.1.2.20'
set firewall group address-group homekit-devices address '10.1.2.21'
set firewall group address-group homekit-devices address '10.1.2.22'
set firewall group address-group homekit-devices address '10.1.2.23'
set firewall group address-group homekit-devices address '10.1.2.24'
set firewall group address-group homekit-devices address '10.1.2.25'

set firewall group address-group ios_devices address '10.1.2.12'
set firewall group address-group ios_devices address '10.1.2.13'
set firewall group address-group ios_devices address '10.1.2.15'
set firewall group address-group ios_devices address '10.1.2.26'

set firewall group address-group jellyfin_clients address '10.1.2.10'
set firewall group address-group jellyfin_clients address '10.1.2.11'
set firewall group address-group jellyfin_clients address '10.1.2.12'
set firewall group address-group jellyfin_clients address '10.1.2.13'
set firewall group address-group jellyfin_clients address '10.1.2.14'

set firewall group address-group k8s_api address '10.5.0.2'

set firewall group address-group k8s_awnet address '10.45.0.26'

set firewall group address-group k8s_ingress address '10.45.0.1'

set firewall group address-group k8s_ingress_allowed address '10.1.3.198'

set firewall group address-group k8s_jellyfin address '10.45.0.21'

set firewall group address-group k8s_mqtt address '10.45.0.10'

set firewall group address-group k8s_nodes address '10.1.1.4'
set firewall group address-group k8s_nodes address '10.1.1.5'
set firewall group address-group k8s_nodes address '10.1.1.6'
set firewall group address-group k8s_nodes address '10.1.1.7'
set firewall group address-group k8s_nodes address '10.1.1.8'
set firewall group address-group k8s_nodes address '10.1.1.9'

set firewall group address-group k8s_plex address '10.45.0.20'

set firewall group address-group k8s_vector_aggregator address '10.45.0.2'

set firewall group address-group mitsubishi_inverters address '10.1.3.200'
set firewall group address-group mitsubishi_inverters address '10.1.3.201'
set firewall group address-group mitsubishi_inverters address '10.1.3.202'
set firewall group address-group mitsubishi_inverters address '10.1.3.203'
set firewall group address-group mitsubishi_inverters address '10.1.3.204'

set firewall group address-group mqtt_clients address '10.1.2.10'
set firewall group address-group mqtt_clients address '10.1.2.11'

set firewall group address-group nas address '10.1.1.3'

set firewall group address-group plex_clients address '10.1.2.11'
set firewall group address-group plex_clients address '10.1.2.12'
set firewall group address-group plex_clients address '10.1.2.13'
set firewall group address-group plex_clients address '10.1.2.14'
set firewall group address-group plex_clients address '10.1.2.15'
set firewall group address-group plex_clients address '10.1.2.23'
set firewall group address-group plex_clients address '10.1.2.24'
set firewall group address-group plex_clients address '10.1.3.25'

set firewall group address-group printers address '10.1.3.13'

set firewall group address-group scanners address '10.1.3.13'

set firewall group address-group vector_journald_allowed address '10.1.3.60'

set firewall group address-group vyos_chronyd address '10.5.0.5'

set firewall group address-group vyos_coredns address '10.5.0.3'

set firewall group address-group vyos_dnsdist address '10.5.0.4'

set firewall group address-group weather_stations address '10.1.3.198'

# Network groups
set firewall group network-group cloudflare-ipv4 network '173.245.48.0/20'
set firewall group network-group cloudflare-ipv4 network '103.21.244.0/22'
set firewall group network-group cloudflare-ipv4 network '103.22.200.0/22'
set firewall group network-group cloudflare-ipv4 network '103.31.4.0/22'
set firewall group network-group cloudflare-ipv4 network '141.101.64.0/18'
set firewall group network-group cloudflare-ipv4 network '108.162.192.0/18'
set firewall group network-group cloudflare-ipv4 network '190.93.240.0/20'
set firewall group network-group cloudflare-ipv4 network '188.114.96.0/20'
set firewall group network-group cloudflare-ipv4 network '197.234.240.0/22'
set firewall group network-group cloudflare-ipv4 network '198.41.128.0/17'
set firewall group network-group cloudflare-ipv4 network '162.158.0.0/15'
set firewall group network-group cloudflare-ipv4 network '104.16.0.0/13'
set firewall group network-group cloudflare-ipv4 network '104.24.0.0/14'
set firewall group network-group cloudflare-ipv4 network '172.64.0.0/13'
set firewall group network-group cloudflare-ipv4 network '131.0.72.0/22'

set firewall group network-group k8s_services network '10.45.0.0/16'

# Port groups
set firewall group port-group wireguard port '51820'
