#!/bin/vbash

# Global
set firewall ipv4 input filter rule 999 action 'drop'
set firewall ipv4 input filter rule 999 description 'Rule: drop_invalid'
set firewall ipv4 input filter rule 999 state invalid
set firewall ipv4 input filter rule 999 log

set firewall ipv6 input filter rule 10 action 'accept'
set firewall ipv6 input filter rule 10 state established
set firewall ipv6 input filter rule 10 state related

# From GUEST to IOT
set firewall ipv4 name guest-iot default-action 'drop'
set firewall ipv4 name guest-iot description 'From GUEST to IOT'
set firewall ipv4 name guest-iot enable-default-log

# From GUEST to LAN
set firewall ipv4 name guest-lan default-action 'drop'
set firewall ipv4 name guest-lan description 'From GUEST to LAN'
set firewall ipv4 name guest-lan enable-default-log

# From GUEST to NTP
set firewall ipv4 name guest-ntp default-action 'drop'
set firewall ipv4 name guest-ntp description 'From GUEST to NTP'
set firewall ipv4 name guest-ntp enable-default-log

# From GUEST to LOCAL
set firewall ipv4 name guest-local default-action 'drop'
set firewall ipv4 name guest-local description 'From GUEST to LOCAL'
set firewall ipv4 name guest-local enable-default-log
set firewall ipv4 name guest-local rule 50 action 'accept'
set firewall ipv4 name guest-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name guest-local rule 50 destination port '67,68'
set firewall ipv4 name guest-local rule 50 protocol 'udp'
set firewall ipv4 name guest-local rule 50 source port '67,68'

# From GUEST to SERVERS
set firewall ipv4 name guest-servers default-action 'drop'
set firewall ipv4 name guest-servers description 'From GUEST to SERVERS'
set firewall ipv4 name guest-servers enable-default-log
set firewall ipv4 name guest-servers rule 100 action 'accept'
set firewall ipv4 name guest-servers rule 100 description 'Rule: accept_omada_traffic'
set firewall ipv4 name guest-servers rule 100 protocol 'tcp_udp'
set firewall ipv4 name guest-servers rule 100 destination group address-group omada
set firewall ipv4 name guest-servers rule 100 destination port '8088,8443'

# From GUEST to CONTAINERS
set firewall ipv4 name guest-containers default-action 'drop'
set firewall ipv4 name guest-containers description 'From GUEST to CONTAINERS'
set firewall ipv4 name guest-containers enable-default-log
set firewall ipv4 name guest-containers rule 40 action 'accept'
set firewall ipv4 name guest-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name guest-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name guest-containers rule 40 protocol 'tcp_udp'

# From GUEST to TRUSTED
set firewall ipv4 name guest-trusted default-action 'drop'
set firewall ipv4 name guest-trusted description 'From GUEST to TRUSTED'
set firewall ipv4 name guest-trusted enable-default-log

# From GUEST to WIRELESS
set firewall ipv4 name guest-wireless default-action 'drop'
set firewall ipv4 name guest-wireless description 'From GUEST to WIRELESS'
set firewall ipv4 name guest-wireless enable-default-log

# From GUEST to VIDEO
set firewall ipv4 name guest-video default-action 'drop'
set firewall ipv4 name guest-video description 'From GUEST to VIDEO'
set firewall ipv4 name guest-video enable-default-log

# From GUEST to WAN
set firewall ipv4 name guest-wan default-action 'accept'
set firewall ipv4 name guest-wan description 'From GUEST to WAN'

# From IOT to GUEST
set firewall ipv4 name iot-guest default-action 'drop'
set firewall ipv4 name iot-guest description 'From IOT to GUEST'
set firewall ipv4 name iot-guest enable-default-log

# From IOT to LAN
set firewall ipv4 name iot-lan default-action 'drop'
set firewall ipv4 name iot-lan description 'From IOT to LAN'
set firewall ipv4 name iot-lan enable-default-log

# From IOT to NTP
set firewall ipv4 name iot-ntp default-action 'drop'
set firewall ipv4 name iot-ntp description 'From IOT to NTP'
set firewall ipv4 name iot-ntp enable-default-log

# From IOT to LOCAL
set firewall ipv4 name iot-local default-action 'drop'
set firewall ipv4 name iot-local description 'From IOT to LOCAL'
set firewall ipv4 name iot-local enable-default-log
set firewall ipv4 name iot-local rule 50 action 'accept'
set firewall ipv4 name iot-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name iot-local rule 50 destination port '67,68'
set firewall ipv4 name iot-local rule 50 protocol 'udp'
set firewall ipv4 name iot-local rule 50 source port '67,68'
set firewall ipv4 name iot-local rule 60 action 'accept'
set firewall ipv4 name iot-local rule 60 description 'Rule: accept_ntp'
set firewall ipv4 name iot-local rule 60 destination port 'ntp'
set firewall ipv4 name iot-local rule 60 protocol 'udp'
set firewall ipv4 name iot-local rule 100 action 'accept'
set firewall ipv4 name iot-local rule 100 description 'Rule: accept_igmp'
set firewall ipv4 name iot-local rule 100 protocol '2'
set firewall ipv4 name iot-local rule 110 action 'accept'
set firewall ipv4 name iot-local rule 110 description 'Rule: accept_mdns'
set firewall ipv4 name iot-local rule 110 destination port 'mdns'
set firewall ipv4 name iot-local rule 110 protocol 'udp'
set firewall ipv4 name iot-local rule 500 action 'accept'
set firewall ipv4 name iot-local rule 500 description 'Rule: accept_icmp_from_zigbee_coordinator'
set firewall ipv4 name iot-local rule 500 protocol 'icmp'
set firewall ipv4 name iot-local rule 500 source group address-group 'zigbee_coordinator'

# From IOT to SERVERS
set firewall ipv4 name iot-servers default-action 'drop'
set firewall ipv4 name iot-servers description 'From IOT to SERVERS'
set firewall ipv4 name iot-servers enable-default-log
set firewall ipv4 name iot-servers rule 100 action 'accept'
set firewall ipv4 name iot-servers rule 100 description 'Rule: accept_nas_smb_from_scanners'
set firewall ipv4 name iot-servers rule 100 destination group address-group 'nas'
set firewall ipv4 name iot-servers rule 100 destination port 'microsoft-ds'
set firewall ipv4 name iot-servers rule 100 protocol 'tcp'
set firewall ipv4 name iot-servers rule 100 source group address-group 'scanners'
set firewall ipv4 name iot-servers rule 200 action 'accept'
set firewall ipv4 name iot-servers rule 200 description 'Rule: accept_plex_from_plex_clients'
set firewall ipv4 name iot-servers rule 200 destination group address-group 'k8s_plex'
set firewall ipv4 name iot-servers rule 200 destination port '32400'
set firewall ipv4 name iot-servers rule 200 protocol 'tcp'
set firewall ipv4 name iot-servers rule 200 source group address-group 'plex_clients'
set firewall ipv4 name iot-servers rule 300 action 'accept'
set firewall ipv4 name iot-servers rule 300 description 'Rule: accept_mqtt_from_mqtt_clients'
set firewall ipv4 name iot-servers rule 300 destination group address-group 'k8s_mqtt'
set firewall ipv4 name iot-servers rule 300 destination port '1883'
set firewall ipv4 name iot-servers rule 300 protocol 'tcp'
set firewall ipv4 name iot-servers rule 300 source group address-group 'mqtt_clients'
set firewall ipv4 name iot-servers rule 420 action 'accept'
set firewall ipv4 name iot-servers rule 420 description 'Rule: accept_k8s_ingress_from_allowed_devices'
set firewall ipv4 name iot-servers rule 420 destination group address-group 'k8s_ingress'
set firewall ipv4 name iot-servers rule 420 destination port 'http,https'
set firewall ipv4 name iot-servers rule 420 protocol 'tcp'
set firewall ipv4 name iot-servers rule 420 source group address-group 'k8s_ingress_allowed'
set firewall ipv4 name iot-servers rule 600 action 'accept'
set firewall ipv4 name iot-servers rule 600 description 'Rule: accept_awnet_from_weather_stations'
set firewall ipv4 name iot-servers rule 600 destination group address-group 'k8s_awnet'
set firewall ipv4 name iot-servers rule 600 destination port '8080'
set firewall ipv4 name iot-servers rule 600 protocol 'tcp'
set firewall ipv4 name iot-servers rule 600 source group address-group 'weather_stations'

# From IOT to CONTAINERS
set firewall ipv4 name iot-containers default-action 'accept'
set firewall ipv4 name iot-containers description 'From IOT to CONTAINERS'
set firewall ipv4 name iot-containers rule 40 action 'accept'
set firewall ipv4 name iot-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name iot-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name iot-containers rule 40 protocol 'tcp_udp'

# From IOT to TRUSTED
set firewall ipv4 name iot-trusted default-action 'drop'
set firewall ipv4 name iot-trusted description 'From IOT to TRUSTED'
set firewall ipv4 name iot-trusted enable-default-log
set firewall ipv4 name iot-trusted rule 100 action 'accept'
set firewall ipv4 name iot-trusted rule 100 description 'Rule: accept_scrypted_for_homekit'
set firewall ipv4 name iot-trusted rule 100 protocol 'tcp_udp'
set firewall ipv4 name iot-trusted rule 100 source group address-group 'scrypted'
set firewall ipv4 name iot-trusted rule 100 destination group address-group 'homekit-devices'
set firewall ipv4 name iot-trusted rule 110 action 'accept'
set firewall ipv4 name iot-trusted rule 110 description 'Rule: accept_mdns'
set firewall ipv4 name iot-trusted rule 110 destination port 'mdns'
set firewall ipv4 name iot-trusted rule 110 protocol 'udp'

# From IOT to WIRELESS
set firewall ipv4 name iot-wireless default-action 'drop'
set firewall ipv4 name iot-wireless description 'From IOT to WIRELESS'
set firewall ipv4 name iot-wireless enable-default-log
set firewall ipv4 name iot-wireless rule 100 action 'accept'
set firewall ipv4 name iot-wireless rule 100 description 'Rule: accept_scrypted_for_homekit'
set firewall ipv4 name iot-wireless rule 100 protocol 'tcp_udp'
set firewall ipv4 name iot-wireless rule 100 source group address-group 'scrypted'
set firewall ipv4 name iot-wireless rule 100 destination group address-group 'homekit-devices'
set firewall ipv4 name iot-wireless rule 110 action 'accept'
set firewall ipv4 name iot-wireless rule 110 description 'Rule: accept_mdns'
set firewall ipv4 name iot-wireless rule 110 destination port 'mdns'
set firewall ipv4 name iot-wireless rule 110 protocol 'udp'

# From IOT to VIDEO
set firewall ipv4 name iot-video default-action 'drop'
set firewall ipv4 name iot-video description 'From IOT to VIDEO'
set firewall ipv4 name iot-video enable-default-log
set firewall ipv4 name iot-video rule 100 action 'accept'
set firewall ipv4 name iot-video rule 100 description 'Rule: accept_mdk8s_nodes'
set firewall ipv4 name iot-video rule 100 protocol 'tcp'
set firewall ipv4 name iot-video rule 100 source group address-group 'k8s_nodes'

# From IOT to WAN
set firewall ipv4 name iot-wan default-action 'accept'
set firewall ipv4 name iot-wan description 'From IOT to WAN'

# From LAN to GUEST
set firewall ipv4 name lan-guest default-action 'drop'
set firewall ipv4 name lan-guest description 'From LAN to GUEST'
set firewall ipv4 name lan-guest enable-default-log

# From LAN to NTP
set firewall ipv4 name lan-ntp default-action 'drop'
set firewall ipv4 name lan-ntp description 'From LAN to NTP'
set firewall ipv4 name lan-ntp enable-default-log

# From LAN to IOT
set firewall ipv4 name lan-iot default-action 'drop'
set firewall ipv4 name lan-iot description 'From LAN to IOT'
set firewall ipv4 name lan-iot enable-default-log

# From LAN to LOCAL
set firewall ipv4 name lan-local default-action 'drop'
set firewall ipv4 name lan-local description 'From LAN to LOCAL'
set firewall ipv4 name lan-local enable-default-log
set firewall ipv4 name lan-local rule 50 action 'accept'
set firewall ipv4 name lan-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name lan-local rule 50 destination port '67,68'
set firewall ipv4 name lan-local rule 50 protocol 'udp'
set firewall ipv4 name lan-local rule 50 source port '67,68'
set firewall ipv4 name lan-local rule 60 action 'accept'
set firewall ipv4 name lan-local rule 60 description 'Rule: accept_ntp'
set firewall ipv4 name lan-local rule 60 destination port 'ntp'
set firewall ipv4 name lan-local rule 60 protocol 'udp'

# From LAN to SERVERS
set firewall ipv4 name lan-servers default-action 'drop'
set firewall ipv4 name lan-servers description 'From LAN to SERVERS'
set firewall ipv4 name lan-servers enable-default-log
set firewall ipv4 name lan-servers rule 100 action 'accept'
set firewall ipv4 name lan-servers rule 100 description 'Rule: accept_omada_traffic'
set firewall ipv4 name lan-servers rule 100 protocol 'tcp_udp'
set firewall ipv4 name lan-servers rule 100 destination group address-group omada

# From LAN to CONTAINERS
set firewall ipv4 name lan-containers default-action 'accept'
set firewall ipv4 name lan-containers description 'From LAN to CONTAINERS'
set firewall ipv4 name lan-containers rule 40 action 'accept'
set firewall ipv4 name lan-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name lan-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name lan-containers rule 40 protocol 'tcp_udp'

# From LAN to TRUSTED
set firewall ipv4 name lan-trusted default-action 'drop'
set firewall ipv4 name lan-trusted description 'From LAN to TRUSTED'
set firewall ipv4 name lan-trusted enable-default-log

# From LAN to WIRELESS
set firewall ipv4 name lan-wireless default-action 'drop'
set firewall ipv4 name lan-wireless description 'From LAN to WIRELESS'
set firewall ipv4 name lan-wireless enable-default-log

# From LAN to VIDEO
set firewall ipv4 name lan-video default-action 'drop'
set firewall ipv4 name lan-video description 'From LAN to VIDEO'
set firewall ipv4 name lan-video enable-default-log

# From LAN to WAN
set firewall ipv4 name lan-wan default-action 'accept'
set firewall ipv4 name lan-wan description 'From LAN to WAN'

# From NTP to GUEST
set firewall ipv4 name ntp-guest default-action 'drop'
set firewall ipv4 name ntp-guest description 'From NTP to GUEST'
set firewall ipv4 name ntp-guest enable-default-log

# From NTP to LAN
set firewall ipv4 name ntp-lan default-action 'drop'
set firewall ipv4 name ntp-lan description 'From NTP to LAN'
set firewall ipv4 name ntp-lan enable-default-log

# From NTP to IOT
set firewall ipv4 name ntp-iot default-action 'drop'
set firewall ipv4 name ntp-iot description 'From NTP to IOT'
set firewall ipv4 name ntp-iot enable-default-log

# From NTP to LOCAL
set firewall ipv4 name ntp-local default-action 'drop'
set firewall ipv4 name ntp-local description 'From NTP to LOCAL'
set firewall ipv4 name ntp-local enable-default-log
set firewall ipv4 name ntp-local rule 50 action 'accept'
set firewall ipv4 name ntp-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name ntp-local rule 50 destination port '67,68'
set firewall ipv4 name ntp-local rule 50 protocol 'udp'
set firewall ipv4 name ntp-local rule 50 source port '67,68'

# From NTP to SERVERS
set firewall ipv4 name ntp-servers default-action 'drop'
set firewall ipv4 name ntp-servers description 'From NTP to SERVERS'
set firewall ipv4 name ntp-servers enable-default-log
set firewall ipv4 name ntp-servers rule 100 action 'accept'
set firewall ipv4 name ntp-servers rule 100 description 'Rule: accept_omada_traffic'
set firewall ipv4 name ntp-servers rule 100 protocol 'tcp_udp'
set firewall ipv4 name ntp-servers rule 100 destination group address-group omada

# From NTP to CONTAINERS
set firewall ipv4 name ntp-containers default-action 'accept'
set firewall ipv4 name ntp-containers description 'From NTP to CONTAINERS'
set firewall ipv4 name ntp-containers rule 40 action 'accept'
set firewall ipv4 name ntp-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name ntp-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name ntp-containers rule 40 protocol 'tcp_udp'

# From NTP to TRUSTED
set firewall ipv4 name ntp-trusted default-action 'drop'
set firewall ipv4 name ntp-trusted description 'From NTP to TRUSTED'
set firewall ipv4 name ntp-trusted enable-default-log

# From NTP to WIRELESS
set firewall ipv4 name ntp-wireless default-action 'drop'
set firewall ipv4 name ntp-wireless description 'From NTP to WIRELESS'
set firewall ipv4 name ntp-wireless enable-default-log

# From NTP to VIDEO
set firewall ipv4 name ntp-video default-action 'drop'
set firewall ipv4 name ntp-video description 'From NTP to VIDEO'
set firewall ipv4 name ntp-video enable-default-log

# From NTP to WAN
set firewall ipv4 name ntp-wan default-action 'accept'
set firewall ipv4 name ntp-wan description 'From NTP to WAN'

# From LOCAL to GUEST
set firewall ipv4 name local-guest default-action 'drop'
set firewall ipv4 name local-guest description 'From LOCAL to GUEST'
set firewall ipv4 name local-guest enable-default-log

# From LOCAL to IOT
set firewall ipv4 name local-iot default-action 'drop'
set firewall ipv4 name local-iot description 'From LOCAL to IOT'
set firewall ipv4 name local-iot enable-default-log
set firewall ipv4 name local-iot rule 100 action 'accept'
set firewall ipv4 name local-iot rule 100 description 'Rule: accept_igmp'
set firewall ipv4 name local-iot rule 100 protocol '2'
set firewall ipv4 name local-iot rule 110 action 'accept'
set firewall ipv4 name local-iot rule 110 description 'Rule: accept_mdns'
set firewall ipv4 name local-iot rule 110 destination port 'mdns'
set firewall ipv4 name local-iot rule 110 protocol 'udp'

# From LOCAL to NTP
set firewall ipv4 name local-lan default-action 'drop'
set firewall ipv4 name local-lan description 'From LOCAL to NTP'
set firewall ipv4 name local-lan enable-default-log

# From LOCAL to NTP
set firewall ipv4 name local-ntp default-action 'drop'
set firewall ipv4 name local-ntp description 'From LOCAL to NTP'
set firewall ipv4 name local-ntp enable-default-log
set firewall ipv4 name local-ntp rule 100 action 'accept'
set firewall ipv4 name local-ntp rule 100 description 'Rule: accept_ntp'
set firewall ipv4 name local-ntp rule 100 destination port 'ntp'
set firewall ipv4 name local-ntp rule 100 protocol 'udp'

# From LOCAL to SERVERS
set firewall ipv4 name local-servers default-action 'drop'
set firewall ipv4 name local-servers description 'From LOCAL to SERVERS'
set firewall ipv4 name local-servers enable-default-log
set firewall ipv4 name local-servers rule 40 action 'accept'
set firewall ipv4 name local-servers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name local-servers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name local-servers rule 40 protocol 'tcp_udp'
set firewall ipv4 name local-servers rule 50 action 'accept'
set firewall ipv4 name local-servers rule 50 description 'Rule: accept_ntp'
set firewall ipv4 name local-servers rule 50 destination port 'ntp'
set firewall ipv4 name local-servers rule 50 protocol 'udp'
set firewall ipv4 name local-servers rule 60 action 'accept'
set firewall ipv4 name local-servers rule 60 description 'Rule: accept_mdns'
set firewall ipv4 name local-servers rule 60 destination port 'mdns'
set firewall ipv4 name local-servers rule 60 protocol 'udp'
set firewall ipv4 name local-servers rule 70 action 'accept'
set firewall ipv4 name local-servers rule 70 description 'Rule: accept_bgp'
set firewall ipv4 name local-servers rule 70 destination port 'bgp'
set firewall ipv4 name local-servers rule 70 protocol 'tcp'
set firewall ipv4 name local-servers rule 100 action 'accept'
set firewall ipv4 name local-servers rule 100 description 'Rule: accept_k8s_api'
set firewall ipv4 name local-servers rule 100 destination port '6443'
set firewall ipv4 name local-servers rule 100 protocol 'tcp'
# Temporary fix for tftp problem
set firewall ipv4 name local-servers rule 120 action 'accept'
set firewall ipv4 name local-servers rule 120 description 'Rule: accept_tftp_udp'
set firewall ipv4 name local-servers rule 120 protocol 'udp'
set firewall ipv4 name local-servers rule 200 action 'accept'
set firewall ipv4 name local-servers rule 200 description 'Rule: accept_vector_syslog'
set firewall ipv4 name local-servers rule 200 destination group address-group 'k8s_vector_aggregator'
set firewall ipv4 name local-servers rule 200 destination port '6001'
set firewall ipv4 name local-servers rule 200 protocol 'tcp'

# From LOCAL to CONTAINERS
set firewall ipv4 name local-containers default-action 'accept'
set firewall ipv4 name local-containers description 'From LOCAL to CONTAINERS'
set firewall ipv4 name local-containers rule 40 action 'accept'
set firewall ipv4 name local-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name local-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name local-containers rule 40 protocol 'tcp_udp'

# From LOCAL to TRUSTED
set firewall ipv4 name local-trusted default-action 'drop'
set firewall ipv4 name local-trusted description 'From LOCAL to WIRELESS'
set firewall ipv4 name local-trusted enable-default-log
set firewall ipv4 name local-trusted rule 100 action 'accept'
set firewall ipv4 name local-trusted rule 100 description 'Rule: accept_igmp'
set firewall ipv4 name local-trusted rule 100 protocol '2'
set firewall ipv4 name local-trusted rule 110 action 'accept'
set firewall ipv4 name local-trusted rule 110 description 'Rule: accept_mdns'
set firewall ipv4 name local-trusted rule 110 destination port 'mdns'
set firewall ipv4 name local-trusted rule 110 protocol 'udp'

set firewall ipv6 name local-trusted default-action 'drop'
set firewall ipv6 name local-trusted description 'From LOCAL to TRUSTED'
set firewall ipv6 name local-trusted enable-default-log
set firewall ipv6 name local-trusted rule 1 action 'accept'
set firewall ipv6 name local-trusted rule 1 description 'Rule: accept_icmpv6'
set firewall ipv6 name local-trusted rule 1 protocol 'icmpv6'

# From LOCAL to WIRELESS
set firewall ipv4 name local-wireless default-action 'drop'
set firewall ipv4 name local-wireless description 'From LOCAL to WIRELESS'
set firewall ipv4 name local-wireless enable-default-log
set firewall ipv4 name local-wireless rule 100 action 'accept'
set firewall ipv4 name local-wireless rule 100 description 'Rule: accept_igmp'
set firewall ipv4 name local-wireless rule 100 protocol '2'
set firewall ipv4 name local-wireless rule 110 action 'accept'
set firewall ipv4 name local-wireless rule 110 description 'Rule: accept_mdns'
set firewall ipv4 name local-wireless rule 110 destination port 'mdns'
set firewall ipv4 name local-wireless rule 110 protocol 'udp'

set firewall ipv6 name local-wireless default-action 'drop'
set firewall ipv6 name local-wireless description 'From LOCAL to WIRELESSS'
set firewall ipv6 name local-wireless enable-default-log
set firewall ipv6 name local-wireless rule 1 action 'accept'
set firewall ipv6 name local-wireless rule 1 description 'Rule: accept_icmpv6'
set firewall ipv6 name local-wireless rule 1 protocol 'icmpv6'

# From LOCAL to VIDEO
set firewall ipv4 name local-video default-action 'drop'
set firewall ipv4 name local-video description 'From LOCAL to VIDEO'
set firewall ipv4 name local-video enable-default-log

# From LOCAL to WAN
set firewall ipv4 name local-wan default-action 'accept'
set firewall ipv4 name local-wan description 'From LOCAL to WAN'

set firewall ipv6 name local-wan default-action 'accept'
set firewall ipv6 name local-wan description 'From LOCAL to WAN'

# From SERVERS to GUEST
set firewall ipv4 name servers-guest default-action 'drop'
set firewall ipv4 name servers-guest description 'From SERVERS to GUEST'
set firewall ipv4 name servers-guest enable-default-log

# From SERVERS to IOT
set firewall ipv4 name servers-iot default-action 'drop'
set firewall ipv4 name servers-iot description 'From SERVERS to IOT'
set firewall ipv4 name servers-iot enable-default-log
set firewall ipv4 name servers-iot rule 100 action 'accept'
set firewall ipv4 name servers-iot rule 100 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name servers-iot rule 100 protocol 'tcp'
set firewall ipv4 name servers-iot rule 100 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-iot rule 110 action 'accept'
set firewall ipv4 name servers-iot rule 110 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name servers-iot rule 110 protocol 'icmp'
set firewall ipv4 name servers-iot rule 110 source group address-group 'k8s_nodes'

# From SERVERS to LAN
set firewall ipv4 name servers-lan default-action 'drop'
set firewall ipv4 name servers-lan description 'From SERVERS to LAN'

# From SERVERS to NTP
set firewall ipv4 name servers-ntp default-action 'drop'
set firewall ipv4 name servers-ntp description 'From SERVERS to NTP'

# From SERVERS to LOCAL
set firewall ipv4 name servers-local default-action 'drop'
set firewall ipv4 name servers-local description 'From SERVERS to LOCAL'
set firewall ipv4 name servers-local enable-default-log
set firewall ipv4 name servers-local rule 50 action 'accept'
set firewall ipv4 name servers-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name servers-local rule 50 destination port '67,68'
set firewall ipv4 name servers-local rule 50 protocol 'udp'
set firewall ipv4 name servers-local rule 50 source port '67,68'
set firewall ipv4 name servers-local rule 60 action 'accept'
set firewall ipv4 name servers-local rule 60 description 'Rule: accept_ntp'
set firewall ipv4 name servers-local rule 60 destination port 'ntp'
set firewall ipv4 name servers-local rule 60 protocol 'udp'
set firewall ipv4 name servers-local rule 70 action 'accept'
set firewall ipv4 name servers-local rule 70 description 'Rule: accept_bgp'
set firewall ipv4 name servers-local rule 70 destination port 'bgp'
set firewall ipv4 name servers-local rule 70 protocol 'tcp'
set firewall ipv4 name servers-local rule 80 action 'accept'
set firewall ipv4 name servers-local rule 80 description 'Rule: accept_tftp'
set firewall ipv4 name servers-local rule 80 destination port '69'
set firewall ipv4 name servers-local rule 80 protocol 'udp'
set firewall ipv4 name servers-local rule 100 action 'accept'
set firewall ipv4 name servers-local rule 100 description 'Rule: accept_node_exporter_from_k8s_nodes'
set firewall ipv4 name servers-local rule 100 destination port '9100'
set firewall ipv4 name servers-local rule 100 protocol 'tcp'
set firewall ipv4 name servers-local rule 100 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-local rule 110 action 'accept'
set firewall ipv4 name servers-local rule 110 description 'Rule: accept_speedtest_exporter_from_k8s_nodes'
set firewall ipv4 name servers-local rule 110 destination port '9798'
set firewall ipv4 name servers-local rule 110 protocol 'tcp'
set firewall ipv4 name servers-local rule 110 source group address-group 'k8s_nodes'
set firewall ipv4 name servers-local rule 120 action 'accept'
set firewall ipv4 name servers-local rule 120 description 'Rule: accept_mdns'
set firewall ipv4 name servers-local rule 120 destination port 'mdns'
set firewall ipv4 name servers-local rule 120 protocol 'udp'

# From SERVERS to CONTAINERS
set firewall ipv4 name servers-containers default-action 'accept'
set firewall ipv4 name servers-containers description 'From SERVERS to CONTAINERS'
# Commented because this is very noisy
# set firewall ipv4 name servers-containers enable-default-log
set firewall ipv4 name servers-containers rule 40 action 'accept'
set firewall ipv4 name servers-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name servers-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name servers-containers rule 40 protocol 'tcp_udp'
set firewall ipv4 name servers-containers rule 100 action 'accept'
set firewall ipv4 name servers-containers rule 100 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name servers-containers rule 100 protocol 'tcp'
set firewall ipv4 name servers-containers rule 100 source group address-group 'k8s_nodes'

# From SERVERS to TRUSTED
set firewall ipv4 name servers-trusted default-action 'drop'
set firewall ipv4 name servers-trusted description 'From SERVERS to TRUSTED'

# From SERVERS to WIRELESS
set firewall ipv4 name servers-wireless default-action 'drop'
set firewall ipv4 name servers-wireless description 'From SERVERS to WIRELESS'

# From SERVERS to VIDEO
set firewall ipv4 name servers-video default-action 'drop'
set firewall ipv4 name servers-video description 'From SERVERS to VIDEO'
set firewall ipv4 name servers-video enable-default-log
set firewall ipv4 name servers-video rule 100 action 'accept'
set firewall ipv4 name servers-video rule 100 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name servers-video rule 100 protocol 'tcp_udp'
set firewall ipv4 name servers-video rule 100 source group address-group 'k8s_nodes'

# From SERVERS to WAN
set firewall ipv4 name servers-wan default-action 'accept'
set firewall ipv4 name servers-wan description 'From SERVERS to WAN'

# From CONTAINERS to GUEST
set firewall ipv4 name containers-guest default-action 'drop'
set firewall ipv4 name containers-guest description 'From CONTAINERS to GUEST'
set firewall ipv4 name containers-guest enable-default-log

# From CONTAINERS to IOT
set firewall ipv4 name containers-iot default-action 'drop'
set firewall ipv4 name containers-iot description 'From CONTAINERS to IOT'
set firewall ipv4 name containers-iot enable-default-log

# From CONTAINERS to LAN
set firewall ipv4 name containers-lan default-action 'drop'
set firewall ipv4 name containers-lan description 'From CONTAINERS to LAN'
set firewall ipv4 name containers-lan enable-default-log

# From CONTAINERS to NTP
set firewall ipv4 name containers-ntp default-action 'drop'
set firewall ipv4 name containers-ntp description 'From CONTAINERS to NTP'
set firewall ipv4 name containers-ntp enable-default-log

# From CONTAINERS to LOCAL
set firewall ipv4 name containers-local default-action 'drop'
set firewall ipv4 name containers-local description 'From CONTAINERS to LOCAL'
set firewall ipv4 name containers-local enable-default-log
set firewall ipv4 name containers-local rule 50 action 'accept'
set firewall ipv4 name containers-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name containers-local rule 50 destination port '67,68'
set firewall ipv4 name containers-local rule 50 protocol 'udp'
set firewall ipv4 name containers-local rule 50 source port '67,68'
set firewall ipv4 name containers-local rule 60 action 'accept'
set firewall ipv4 name containers-local rule 60 description 'Rule: accept_ntp'
set firewall ipv4 name containers-local rule 60 destination port 'ntp'
set firewall ipv4 name containers-local rule 60 protocol 'udp'

# From CONTAINERS to SERVERS
set firewall ipv4 name containers-servers default-action 'accept'
set firewall ipv4 name containers-servers description 'From CONTAINERS to SERVERS'
set firewall ipv4 name containers-servers rule 1 action 'accept'
set firewall ipv4 name containers-servers rule 1 description 'Rule: accept_icmp'
set firewall ipv4 name containers-servers rule 1 protocol 'icmp'

# From CONTAINERS to TRUSTED
set firewall ipv4 name containers-trusted default-action 'drop'
set firewall ipv4 name containers-trusted description 'From CONTAINERS to TRUSTED'
set firewall ipv4 name containers-trusted enable-default-log

# From CONTAINERS to WIRELESS
set firewall ipv4 name containers-wireless default-action 'drop'
set firewall ipv4 name containers-wireless description 'From CONTAINERS to WIRELESS'
set firewall ipv4 name containers-wireless enable-default-log

# From CONTAINERS to VIDEO
set firewall ipv4 name containers-video default-action 'drop'
set firewall ipv4 name containers-video description 'From CONTAINERS to VIDEO'
set firewall ipv4 name containers-video enable-default-log

# From CONTAINERS to WAN
set firewall ipv4 name containers-wan default-action 'accept'
set firewall ipv4 name containers-wan description 'From CONTAINERS to WAN'

# From TRUSTED to GUEST
set firewall ipv4 name trusted-guest default-action 'drop'
set firewall ipv4 name trusted-guest description 'From TRUSTED to GUEST'
set firewall ipv4 name trusted-guest enable-default-log

# From TRUSTED to IOT
set firewall ipv4 name trusted-iot default-action 'accept'
set firewall ipv4 name trusted-iot description 'From TRUSTED to IOT'

# From TRUSTED to LAN
set firewall ipv4 name trusted-lan default-action 'accept'
set firewall ipv4 name trusted-lan description 'From TRUSTED to LAN'

# From TRUSTED to NTP
set firewall ipv4 name trusted-ntp default-action 'accept'
set firewall ipv4 name trusted-ntp description 'From TRUSTED to NTP'

# From TRUSTED to LOCAL
set firewall ipv4 name trusted-local default-action 'drop'
set firewall ipv4 name trusted-local description 'From TRUSTED to LOCAL'
set firewall ipv4 name trusted-local enable-default-log
set firewall ipv4 name trusted-local rule 50 action 'accept'
set firewall ipv4 name trusted-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name trusted-local rule 50 destination port '67,68'
set firewall ipv4 name trusted-local rule 50 protocol 'udp'
set firewall ipv4 name trusted-local rule 50 source port '67,68'
set firewall ipv4 name trusted-local rule 60 action 'accept'
set firewall ipv4 name trusted-local rule 60 description 'Rule: accept_ntp'
set firewall ipv4 name trusted-local rule 60 destination port 'ntp'
set firewall ipv4 name trusted-local rule 60 protocol 'udp'
set firewall ipv4 name trusted-local rule 100 action 'accept'
set firewall ipv4 name trusted-local rule 100 description 'Rule: accept_igmp'
set firewall ipv4 name trusted-local rule 100 protocol '2'
set firewall ipv4 name trusted-local rule 110 action 'accept'
set firewall ipv4 name trusted-local rule 110 description 'Rule: accept_mdns'
set firewall ipv4 name trusted-local rule 110 destination port 'mdns'
set firewall ipv4 name trusted-local rule 110 protocol 'udp'
set firewall ipv4 name trusted-local rule 200 action 'accept'
set firewall ipv4 name trusted-local rule 200 description 'Rule: accept_ssh'
set firewall ipv4 name trusted-local rule 200 destination port 'ssh'
set firewall ipv4 name trusted-local rule 200 protocol 'tcp'
set firewall ipv4 name trusted-local rule 210 action 'accept'
set firewall ipv4 name trusted-local rule 210 description 'Rule: accept_vyos_api'
set firewall ipv4 name trusted-local rule 210 destination port '8443'
set firewall ipv4 name trusted-local rule 210 protocol 'tcp'
set firewall ipv4 name trusted-local rule 220 action 'accept'
set firewall ipv4 name trusted-local rule 220 description 'Rule: accept_wireguard'
set firewall ipv4 name trusted-local rule 220 destination port '51820'
set firewall ipv4 name trusted-local rule 220 protocol 'udp'

set firewall ipv6 name trusted-local default-action 'drop'
set firewall ipv6 name trusted-local description 'From TRUSTED to LOCAL'
set firewall ipv6 name trusted-local enable-default-log
set firewall ipv6 name trusted-local rule 1 action 'accept'
set firewall ipv6 name trusted-local rule 1 description 'Rule: accept_icmpv6'
set firewall ipv6 name trusted-local rule 1 protocol 'icmpv6'

# From TRUSTED to SERVERS
set firewall ipv4 name trusted-servers default-action 'accept'
set firewall ipv4 name trusted-servers description 'From TRUSTED to SERVERS'
set firewall ipv4 name trusted-servers rule 200 action 'accept'
set firewall ipv4 name trusted-servers rule 200 description 'Rule: accept_plex_from_plex_clients'
set firewall ipv4 name trusted-servers rule 200 destination group address-group 'k8s_plex'
set firewall ipv4 name trusted-servers rule 200 destination port '32400'
set firewall ipv4 name trusted-servers rule 200 protocol 'tcp'
set firewall ipv4 name trusted-servers rule 200 source group address-group 'plex_clients'

# From TRUSTED to CONTAINERS
set firewall ipv4 name trusted-containers default-action 'accept'
set firewall ipv4 name trusted-containers description 'From TRUSTED to CONTAINERS'
set firewall ipv4 name trusted-containers rule 40 action 'accept'
set firewall ipv4 name trusted-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name trusted-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name trusted-containers rule 40 protocol 'tcp_udp'

# From TRUSTED to WIRELESS
set firewall ipv4 name trusted-wireless default-action 'accept'
set firewall ipv4 name trusted-wireless description 'From TRUSTED to WIRELESS'

# From TRUSTED to VIDEO
set firewall ipv4 name trusted-video default-action 'accept'
set firewall ipv4 name trusted-video description 'From TRUSTED to VIDEO'

# From TRUSTED to WAN
set firewall ipv4 name trusted-wan default-action 'accept'
set firewall ipv4 name trusted-wan description 'From TRUSTED to WAN'

set firewall ipv6 name trusted-wan default-action 'accept'
set firewall ipv6 name trusted-wan description 'From TRUSTED to WAN'

# From WIRELESS to GUEST
set firewall ipv4 name wireless-guest default-action 'drop'
set firewall ipv4 name wireless-guest description 'From WIRELESS to GUEST'
set firewall ipv4 name wireless-guest enable-default-log

# From WIRELESS to IOT
set firewall ipv4 name wireless-iot default-action 'accept'
set firewall ipv4 name wireless-iot description 'From WIRELESS to IOT'

# From WIRELESS to LAN
set firewall ipv4 name wireless-lan default-action 'accept'
set firewall ipv4 name wireless-lan description 'From WIRELESS to LAN'

# From WIRELESS to NTP
set firewall ipv4 name wireless-ntp default-action 'accept'
set firewall ipv4 name wireless-ntp description 'From WIRELESS to NTP'

# From WIRELESS to LOCAL
set firewall ipv4 name wireless-local default-action 'drop'
set firewall ipv4 name wireless-local description 'From WIRELESS to LOCAL'
set firewall ipv4 name wireless-local enable-default-log
set firewall ipv4 name wireless-local rule 50 action 'accept'
set firewall ipv4 name wireless-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name wireless-local rule 50 destination port '67,68'
set firewall ipv4 name wireless-local rule 50 protocol 'udp'
set firewall ipv4 name wireless-local rule 50 source port '67,68'
set firewall ipv4 name wireless-local rule 60 action 'accept'
set firewall ipv4 name wireless-local rule 60 description 'Rule: accept_ntp'
set firewall ipv4 name wireless-local rule 60 destination port 'ntp'
set firewall ipv4 name wireless-local rule 60 protocol 'udp'
set firewall ipv4 name wireless-local rule 100 action 'accept'
set firewall ipv4 name wireless-local rule 100 description 'Rule: accept_igmp'
set firewall ipv4 name wireless-local rule 100 protocol '2'
set firewall ipv4 name wireless-local rule 110 action 'accept'
set firewall ipv4 name wireless-local rule 110 description 'Rule: accept_mdns'
set firewall ipv4 name wireless-local rule 110 destination port 'mdns'
set firewall ipv4 name wireless-local rule 110 protocol 'udp'
set firewall ipv4 name wireless-local rule 200 action 'accept'
set firewall ipv4 name wireless-local rule 200 description 'Rule: accept_ssh'
set firewall ipv4 name wireless-local rule 200 destination port 'ssh'
set firewall ipv4 name wireless-local rule 200 protocol 'tcp'
set firewall ipv4 name wireless-local rule 210 action 'accept'
set firewall ipv4 name wireless-local rule 210 description 'Rule: accept_vyos_api'
set firewall ipv4 name wireless-local rule 210 destination port '8443'
set firewall ipv4 name wireless-local rule 210 protocol 'tcp'
set firewall ipv4 name wireless-local rule 220 action 'accept'
set firewall ipv4 name wireless-local rule 220 description 'Rule: accept_wireguard'
set firewall ipv4 name wireless-local rule 220 destination port '51820'
set firewall ipv4 name wireless-local rule 220 protocol 'udp'

set firewall ipv6 name wireless-local default-action 'drop'
set firewall ipv6 name wireless-local description 'From WIRELESS to LOCAL'
set firewall ipv6 name wireless-local enable-default-log
set firewall ipv6 name wireless-local rule 1 action 'accept'
set firewall ipv6 name wireless-local rule 1 description 'Rule: accept_icmpv6'
set firewall ipv6 name wireless-local rule 1 protocol 'icmpv6'

# From WIRELESS to SERVERS
set firewall ipv4 name wireless-servers default-action 'accept'
set firewall ipv4 name wireless-servers description 'From WIRELESS to SERVERS'
set firewall ipv4 name wireless-servers rule 200 action 'accept'
set firewall ipv4 name wireless-servers rule 200 description 'Rule: accept_plex_from_plex_clients'
set firewall ipv4 name wireless-servers rule 200 destination group address-group 'k8s_plex'
set firewall ipv4 name wireless-servers rule 200 destination port '32400'
set firewall ipv4 name wireless-servers rule 200 protocol 'tcp'
set firewall ipv4 name wireless-servers rule 200 source group address-group 'plex_clients'

# From WIRELESS to CONTAINERS
set firewall ipv4 name wireless-containers default-action 'accept'
set firewall ipv4 name wireless-containers description 'From WIRELESS to CONTAINERS'
set firewall ipv4 name wireless-containers rule 40 action 'accept'
set firewall ipv4 name wireless-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name wireless-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name wireless-containers rule 40 protocol 'tcp_udp'

# From WIRELESS to TRUSTED
set firewall ipv4 name wireless-trusted default-action 'accept'
set firewall ipv4 name wireless-trusted description 'From WIRELESS to TRUSTED'

# From WIRELESS to VIDEO
set firewall ipv4 name wireless-video default-action 'accept'
set firewall ipv4 name wireless-video description 'From WIRELESS to VIDEO'

# From WIRELESS to WAN
set firewall ipv4 name wireless-wan default-action 'accept'
set firewall ipv4 name wireless-wan description 'From WIRELESS to WAN'

set firewall ipv6 name wireless-wan default-action 'accept'
set firewall ipv6 name wireless-wan description 'From WIRELESS to WAN'

# From VIDEO to GUEST
set firewall ipv4 name video-guest default-action 'drop'
set firewall ipv4 name video-guest description 'From VIDEO to GUEST'
set firewall ipv4 name video-guest enable-default-log

# From VIDEO to IOT
set firewall ipv4 name video-iot default-action 'drop'
set firewall ipv4 name video-iot description 'From VIDEO to IOT'
set firewall ipv4 name video-iot enable-default-log
set firewall ipv4 name video-iot rule 100 action 'accept'
set firewall ipv4 name video-iot rule 100 description 'Rule: allow connecting to hass'
set firewall ipv4 name video-iot rule 100 protocol 'tcp'
set firewall ipv4 name video-iot rule 100 destination group address-group 'k8s_hass'
set firewall ipv4 name video-iot rule 100 destination port '8123'

# From VIDEO to LAN
set firewall ipv4 name video-lan default-action 'drop'
set firewall ipv4 name video-lan description 'From VIDEO to LAN'
set firewall ipv4 name video-lan enable-default-log

# From VIDEO to NTP
set firewall ipv4 name video-ntp default-action 'drop'
set firewall ipv4 name video-ntp description 'From VIDEO to NTP'
set firewall ipv4 name video-ntp enable-default-log

# From VIDEO to LOCAL
set firewall ipv4 name video-local default-action 'drop'
set firewall ipv4 name video-local description 'From VIDEO to LOCAL'
set firewall ipv4 name video-local enable-default-log
set firewall ipv4 name video-local rule 50 action 'accept'
set firewall ipv4 name video-local rule 50 description 'Rule: accept_dhcp'
set firewall ipv4 name video-local rule 50 destination port '67,68'
set firewall ipv4 name video-local rule 50 protocol 'udp'
set firewall ipv4 name video-local rule 50 source port '67,68'
set firewall ipv4 name video-local rule 60 action 'accept'
set firewall ipv4 name video-local rule 60 description 'Rule: accept_ntp'
set firewall ipv4 name video-local rule 60 destination port 'ntp'
set firewall ipv4 name video-local rule 60 protocol 'udp'

# From VIDEO to SERVERS
set firewall ipv4 name video-servers default-action 'drop'
set firewall ipv4 name video-servers description 'From VIDEO to SERVERS'
set firewall ipv4 name video-servers enable-default-log
set firewall ipv4 name video-servers rule 100 action 'accept'
set firewall ipv4 name video-servers rule 100 description 'Rule: accept_k8s_nodes'
set firewall ipv4 name video-servers rule 100 protocol 'udp'
set firewall ipv4 name video-servers rule 100 destination group address-group 'k8s_nodes'
set firewall ipv4 name video-servers rule 100 source port '6987-6989'

# From VIDEO to CONTAINERS
set firewall ipv4 name video-containers default-action 'accept'
set firewall ipv4 name video-containers description 'From VIDEO to CONTAINERS'
set firewall ipv4 name video-containers rule 40 action 'accept'
set firewall ipv4 name video-containers rule 40 description 'Rule: accept_dns'
set firewall ipv4 name video-containers rule 40 destination port 'domain,domain-s'
set firewall ipv4 name video-containers rule 40 protocol 'tcp_udp'

# From VIDEO to TRUSTED
set firewall ipv4 name video-trusted default-action 'drop'
set firewall ipv4 name video-trusted description 'From VIDEO to TRUSTED'
set firewall ipv4 name video-trusted enable-default-log

# From VIDEO to WIRELESS
set firewall ipv4 name video-wireless default-action 'drop'
set firewall ipv4 name video-wireless description 'From VIDEO to WIRELESS'
set firewall ipv4 name video-wireless enable-default-log

# From VIDEO to WAN
set firewall ipv4 name video-wan default-action 'drop'
set firewall ipv4 name video-wan description 'From VIDEO to WAN'

# From WAN to GUEST
set firewall ipv4 name wan-guest default-action 'drop'
set firewall ipv4 name wan-guest description 'From WAN to GUEST'
set firewall ipv4 name wan-guest enable-default-log

# From WAN to IOT
set firewall ipv4 name wan-iot default-action 'drop'
set firewall ipv4 name wan-iot description 'From WAN to IOT'
set firewall ipv4 name wan-iot enable-default-log

# From WAN to LAN
set firewall ipv4 name wan-lan default-action 'drop'
set firewall ipv4 name wan-lan description 'From WAN to LAN'
set firewall ipv4 name wan-lan enable-default-log

# From WAN to NTP
set firewall ipv4 name wan-ntp default-action 'drop'
set firewall ipv4 name wan-ntp description 'From WAN to NTP'
set firewall ipv4 name wan-ntp enable-default-log

# From WAN to LOCAL
set firewall ipv4 name wan-local default-action 'drop'
set firewall ipv4 name wan-local description 'From WAN to LOCAL'
set firewall ipv4 name wan-local enable-default-log
set firewall ipv4 name wan-local rule 100 action 'accept'
set firewall ipv4 name wan-local rule 100 description 'Rule: accept_wireguard'
set firewall ipv4 name wan-local rule 100 destination port '51820'
set firewall ipv4 name wan-local rule 100 protocol 'udp'

set firewall ipv6 name wan-local default-action 'drop'
set firewall ipv6 name wan-local description 'From WAN to LOCAL'
set firewall ipv6 name wan-local rule 20 action 'accept'
set firewall ipv6 name wan-local rule 20 protocol 'icmpv6'
set firewall ipv6 name wan-local rule 30 action 'accept'
set firewall ipv6 name wan-local rule 30 destination port '546'
set firewall ipv6 name wan-local rule 30 protocol 'udp'
set firewall ipv6 name wan-local rule 30 source port '547'

# From WAN to SERVERS
set firewall ipv4 name wan-servers default-action 'drop'
set firewall ipv4 name wan-servers description 'From WAN to SERVERS'
set firewall ipv4 name wan-servers enable-default-log

# From WAN to CONTAINERS
set firewall ipv4 name wan-containers default-action 'drop'
set firewall ipv4 name wan-containers description 'From WAN to CONTAINERS'
set firewall ipv4 name wan-containers enable-default-log

# From WAN to TRUSTED
set firewall ipv4 name wan-trusted default-action 'drop'
set firewall ipv4 name wan-trusted description 'From WAN to TRUSTED'
set firewall ipv4 name wan-trusted enable-default-log

set firewall ipv6 name wan-trusted default-action 'drop'
set firewall ipv6 name wan-trusted description 'From WAN to TRUSTED'
set firewall ipv6 name wan-trusted rule 2 action 'accept'
set firewall ipv6 name wan-trusted rule 2 protocol 'icmpv6'

# From WAN to WIRELESS
set firewall ipv4 name wan-wireless default-action 'drop'
set firewall ipv4 name wan-wireless description 'From WAN to WIRELESS'
set firewall ipv4 name wan-wireless enable-default-log

set firewall ipv6 name wan-wireless default-action 'drop'
set firewall ipv6 name wan-wireless description 'From WAN to WIRELESS'
set firewall ipv6 name wan-wireless rule 2 action 'accept'
set firewall ipv6 name wan-wireless rule 2 protocol 'icmpv6'

# From WAN to VIDEO
set firewall ipv4 name wan-video default-action 'drop'
set firewall ipv4 name wan-video description 'From WAN to VIDEO'
set firewall ipv4 name wan-video enable-default-log
