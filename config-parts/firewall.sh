#!/bin/vbash

# General configuration
set firewall global-options state-policy established action 'accept'
set firewall global-options state-policy related action 'accept'
set firewall global-options all-ping enable
set firewall global-options broadcast-ping disable

# Address Groups
set firewall group address-group homekit-devices address '10.1.2.12'
set firewall group address-group homekit-devices address '10.1.2.13'
set firewall group address-group homekit-devices address '10.1.2.14'
set firewall group address-group homekit-devices address '10.1.5.11'
set firewall group address-group homekit-devices address '10.1.5.13'
set firewall group address-group homekit-devices address '10.1.5.14'
set firewall group address-group homekit-devices address '10.1.5.15'
set firewall group address-group homekit-devices address '10.1.5.16'
set firewall group address-group homekit-devices address '10.1.5.17'
set firewall group address-group homekit-devices address '10.1.5.18'
set firewall group address-group homekit-devices address '10.1.5.19'
set firewall group address-group homekit-devices address '10.1.5.20'

set firewall group address-group k8s_api address '10.5.0.2'

set firewall group address-group k8s_awnet address '10.45.0.26'

set firewall group address-group k8s_ingress address '10.45.0.1'
set firewall group address-group k8s_ingress address '10.45.0.3'

set firewall group address-group k8s_ingress_allowed address '10.1.3.198'

set firewall group address-group k8s_mqtt address '10.45.0.10'

set firewall group address-group k8s_nodes address '10.1.1.4'
set firewall group address-group k8s_nodes address '10.1.1.5'
set firewall group address-group k8s_nodes address '10.1.1.6'
set firewall group address-group k8s_nodes address '10.1.1.7'
set firewall group address-group k8s_nodes address '10.1.1.8'
set firewall group address-group k8s_nodes address '10.1.1.9'
set firewall group address-group k8s_nodes address '10.1.3.7'
set firewall group address-group k8s_nodes address '10.1.3.8'
set firewall group address-group k8s_nodes address '10.1.3.9'

set firewall group address-group k8s_hass address '10.1.3.151'
set firewall group address-group k8s_scrypted address '10.1.3.153'
set firewall group address-group k8s_plex address '10.45.0.20'

set firewall group address-group k8s_vector_aggregator address '10.45.0.2'

set firewall group address-group mqtt_clients address '10.1.3.20'
set firewall group address-group mqtt_clients address '10.1.3.21'
set firewall group address-group mqtt_clients address '10.1.3.22'
set firewall group address-group mqtt_clients address '10.1.3.23'
set firewall group address-group mqtt_clients address '10.1.3.24'
set firewall group address-group mqtt_clients address '10.1.3.43'
set firewall group address-group mqtt_clients address '10.1.3.44'

set firewall group address-group nas address '10.1.1.3'

set firewall group address-group ntp_nodes address '10.1.7.2'
set firewall group address-group ntp_nodes address '10.1.7.3'
set firewall group address-group ntp_nodes address '10.1.7.4'
set firewall group address-group ntp_nodes address '10.1.7.5'

set firewall group address-group omada address '10.1.1.11'

set firewall group address-group omada-devices address '10.1.0.10-10.1.0.22'

set firewall group address-group plex_clients address '10.1.2.10'
set firewall group address-group plex_clients address '10.1.2.11'
set firewall group address-group plex_clients address '10.1.2.12'
set firewall group address-group plex_clients address '10.1.2.13'
set firewall group address-group plex_clients address '10.1.2.14'
set firewall group address-group plex_clients address '10.1.5.10'
set firewall group address-group plex_clients address '10.1.5.11'
set firewall group address-group plex_clients address '10.1.5.12'
set firewall group address-group plex_clients address '10.1.5.14'

set firewall group address-group scanners address '10.1.3.13'

set firewall group address-group scrypted address '10.1.3.153'

set firewall group address-group tftp_server address '10.5.0.20'

set firewall group address-group weather_stations address '10.1.3.38'

set firewall group address-group zigbee_coordinator address '10.1.3.36'

# Apple devices
 set firewall group address-group apple_devices address '10.1.3.16' # Apple TV

 set firewall group port-group apple_services_ports port '3722'
