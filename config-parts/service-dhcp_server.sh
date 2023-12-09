#!/bin/vbash

set service dhcp-server dynamic-dns-update
set service dhcp-server global-parameters 'option arch code 93 = unsigned integer 16;'
set service dhcp-server global-parameters "key ddnsupdate { algorithm hmac-md5; secret ${SECRET_DHCP_DDNS_UPDATE}; };"
set service dhcp-server global-parameters "zone greyrock.io. { primary 10.5.0.3; key ddnsupdate; }"
set service dhcp-server global-parameters "ddns-domainname &quot;greyrock.io.&quot;;"
set service dhcp-server global-parameters "ddns-rev-domainname &quot;in-addr.arpa.&quot;;"
set service dhcp-server global-parameters "zone in-addr.arpa. { primary 10.5.0.3; key ddnsupdate; }"
set service dhcp-server global-parameters "zone 1.10.in-addr.arpa. { primary 10.5.0.3; key ddnsupdate; }"
set service dhcp-server global-parameters "update-optimization false;"
set service dhcp-server global-parameters 'option omada-address code 138 = ip-address;'

# Guest VLAN
set service dhcp-server shared-network-name GUEST authoritative
set service dhcp-server shared-network-name GUEST ping-check
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 default-router '192.168.2.1'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 lease '86400'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 start '192.168.2.200'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 range 0 stop '192.168.2.254'

set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping todds-work-laptop ip-address '192.168.2.11'
set service dhcp-server shared-network-name GUEST subnet 192.168.2.0/24 static-mapping todds-work-laptop mac-address '5c:e9:1e:96:8f:da'

# IoT VLAN
set service dhcp-server shared-network-name IOT authoritative
set service dhcp-server shared-network-name IOT ping-check
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 default-router '10.1.3.1'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 domain-name 'greyrock.io'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 lease '86400'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 range 0 start '10.1.3.200'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 range 0 stop '10.1.3.254'
set service dhcp-server shared-network-name IOT ntp-server 10.1.3.1

set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping ambient-ws5000 ip-address '10.1.3.38'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping ambient-ws5000 mac-address 'd8:f1:5b:15:83:9e'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping basement-iotawatt ip-address '10.1.3.40'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping basement-iotawatt mac-address '44:17:93:06:8e:8f'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping brother-printer ip-address '10.1.3.13'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping brother-printer mac-address 'b4:22:00:44:a0:d7'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping canon-printer ip-address '10.1.3.42'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping canon-printer mac-address '9c:32:ce:52:22:55'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping downstairs-litter-robot ip-address '10.1.3.33'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping downstairs-litter-robot mac-address 'ec:fa:bc:0e:80:9f'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping fsr-lg-tv ip-address '10.1.3.32'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping fsr-lg-tv mac-address '58:fd:b1:96:47:c9'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping gameroom-ps5 ip-address '10.1.3.10'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping gameroom-ps5 mac-address '78:c8:81:c3:0d:d6'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping gameroom-samsung-tv-left ip-address '10.1.3.29'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping gameroom-samsung-tv-left mac-address 'bc:7e:8b:79:e4:ec'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping gameroom-samsung-tv-right ip-address '10.1.3.26'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping gameroom-samsung-tv-right mac-address '98:06:3c:23:74:71'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-iotawatt ip-address '10.1.3.39'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-iotawatt mac-address '44:17:93:07:aa:18'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-door-andy ip-address '10.1.3.35'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-door-andy mac-address 'cc:6a:10:03:2a:2d'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-door-ratgdo-andy ip-address '10.1.3.43'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-door-ratgdo-andy mac-address '10:52:1c:e9:8b:c6'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-door-todd ip-address '10.1.3.34'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-door-todd mac-address 'cc:6a:10:03:29:cb'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-door-ratgdo-todd ip-address '10.1.3.44'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping garage-door-ratgdo-todd mac-address '60:01:94:47:98:7d'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-dining-room ip-address '10.1.3.23'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-dining-room mac-address 'bc:ff:4d:40:95:b7'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-game-room ip-address '10.1.3.24'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-game-room mac-address 'bc:ff:4d:40:90:0f'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-kitchen ip-address '10.1.3.22'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-kitchen mac-address 'bc:ff:4d:40:80:0d'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-master-bedroom ip-address '10.1.3.21'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-master-bedroom mac-address 'bc:ff:4d:40:d7:ef'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-office ip-address '10.1.3.20'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hvac-office mac-address 'bc:ff:4d:40:d1:4c'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hydrawise-sprinkler-controller ip-address '10.1.3.25'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping hydrawise-sprinkler-controller mac-address '00:03:10:b3:72:fa'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping k8s1 ip-address '10.1.3.4'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping k8s1 mac-address '00:30:93:12:38:d3'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping k8s2 ip-address '10.1.3.5'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping k8s2 mac-address '00:30:93:12:38:d6'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping k8s3 ip-address '10.1.3.6'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping k8s3 mac-address '00:30:93:12:38:8c'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping office-hs110-rack ip-address '10.1.3.37'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping office-hs110-rack mac-address '50:c7:bf:7c:ee:70'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping office-samsung-tv ip-address '10.1.3.30'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping office-samsung-tv mac-address '68:27:37:c2:fc:f0'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping ps4 ip-address '10.1.3.11'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping ps4 mac-address '2c:cc:44:a9:b6:47'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping solargedge-inverter ip-address '10.1.3.199'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping solargedge-inverter mac-address '84:d6:c5:11:38:8b'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping nintendo-switch-todd ip-address '10.1.3.12'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping nintendo-switch-todd mac-address '98:b6:e9:f2:64:61'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping teslawallconnecter-todd ip-address '10.1.3.41'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping teslawallconnecter-todd mac-address '98:ed:5c:96:3a:d9'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping tesla-model-3-todd ip-address '10.1.3.28'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping tesla-model-3-todd mac-address '4c:fc:aa:37:cd:f3'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping slzb-06 ip-address '10.1.3.36'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping slzb-06 mac-address 'cc:db:a7:4a:3d:5b'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping upstairs-litter-robot ip-address '10.1.3.31'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping upstairs-litter-robot mac-address '94:b5:55:99:de:70'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping withings-scale ip-address '10.1.3.27'
set service dhcp-server shared-network-name IOT subnet 10.1.3.0/24 static-mapping withings-scale mac-address '00:24:e4:58:73:f6'

# LAN
set service dhcp-server shared-network-name LAN authoritative
set service dhcp-server shared-network-name LAN ping-check
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 default-router '10.1.0.1'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 lease '86400'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 range 0 start '10.1.0.200'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 range 0 stop '10.1.0.254'
set service dhcp-server shared-network-name LAN ntp-server 10.1.0.1
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 subnet-parameters 'option omada-address 10.1.1.11;'

set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping fsr-switch-media ip-address '10.1.0.22'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping fsr-switch-media mac-address '78:8c:b5:37:bd:b1'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping garage-switch ip-address '10.1.0.10'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping garage-switch mac-address '9c:53:22:9d:8e:4b'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping office-switch-24 ip-address '10.1.0.11'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping office-switch-24 mac-address '9c:53:22:a1:05:94'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping office-switch-8 ip-address '10.1.0.12'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping office-switch-8 mac-address '48:22:54:5e:bc:c2'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping office-switch-10-gb ip-address '10.1.0.19'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping office-switch-10-gb mac-address '9c:53:22:c9:bd:52'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping office-switch-media ip-address '10.1.0.20'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping office-switch-media mac-address '78:8c:b5:37:bf:a0'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping gameroom-switch-1-gb ip-address '10.1.0.18'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping gameroom-switch-1-gb mac-address '48:22:54:50:eb:89'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping gameroom-switch-2-5-gb ip-address '10.1.0.13'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping gameroom-switch-2-5-gb mac-address '9c:53:22:72:b2:e4'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping gameroom-switch-media ip-address '10.1.0.21'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping gameroom-switch-media mac-address '78:8c:b5:37:bd:ab'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping upstairs-access-point ip-address '10.1.0.14'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping upstairs-access-point mac-address '1c:61:b4:cc:69:d4'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping gameroom-access-point ip-address '10.1.0.15'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping gameroom-access-point mac-address '1c:61:b4:cc:69:b0'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping kitchen-access-point ip-address '10.1.0.16'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping kitchen-access-point mac-address '1c:61:b4:cc:69:ce'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping outdoor-access-point ip-address '10.1.0.17'
set service dhcp-server shared-network-name LAN subnet 10.1.0.0/24 static-mapping outdoor-access-point mac-address 'ac:15:a2:65:b7:d0'

# NTP
set service dhcp-server shared-network-name NTP authoritative
set service dhcp-server shared-network-name NTP ping-check
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 default-router '10.1.7.1'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 lease '86400'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 range 0 start '10.1.7.200'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 range 0 stop '10.1.7.254'

set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 static-mapping time1 ip-address '10.1.7.2'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 static-mapping time1 mac-address '4e:90:51:6f:5b:40'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 static-mapping time2 ip-address '10.1.7.3'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 static-mapping time2 mac-address '26:04:78:04:b1:70'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 static-mapping time3 ip-address '10.1.7.4'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 static-mapping time3 mac-address '66:e4:b1:63:37:1b'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 static-mapping time4 ip-address '10.1.7.5'
set service dhcp-server shared-network-name NTP subnet 10.1.7.0/24 static-mapping time4 mac-address 'ca:87:ea:8c:48:a2'

# Servers VLAN
set service dhcp-server shared-network-name SERVERS authoritative
set service dhcp-server shared-network-name SERVERS ping-check
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 default-router '10.1.1.1'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 domain-name 'greyrock.io'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 lease '86400'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 range 0 start '10.1.1.200'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 range 0 stop '10.1.1.254'
set service dhcp-server shared-network-name SERVERS ntp-server 10.1.1.1
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 bootfile-server '10.1.1.1'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 subnet-parameters 'if option arch = 00:00 { filename &quot;netboot.xyz-undionly.kpxe&quot;; }'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 subnet-parameters 'if option arch = 00:02 { filename &quot;netboot.xyz-snponly.efi&quot;; }'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 subnet-parameters 'if option arch = 00:06 { filename &quot;netboot.xyz-snponly.efi&quot;; }'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 subnet-parameters 'if option arch = 00:07 { filename &quot;netboot.xyz-snponly.efi&quot;; }'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 subnet-parameters 'if option arch = 00:08 { filename &quot;netboot.xyz-snponly.efi&quot;; }'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 subnet-parameters 'if option arch = 00:09 { filename &quot;netboot.xyz-snponly.efi&quot;; }'

set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping gateway-ipmi mac-address '3c:ec:ef:5a:e2:b2'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping gateway-ipmi ip-address '10.1.1.50'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping k8s1 ip-address '10.1.1.4'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping k8s1 mac-address '00:30:93:12:38:d3'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping k8s2 ip-address '10.1.1.5'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping k8s2 mac-address '00:30:93:12:38:d6'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping k8s3 ip-address '10.1.1.6'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping k8s3 mac-address '00:30:93:12:38:8c'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping oc300 ip-address '10.1.1.11'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping oc300 mac-address '48:22:54:dd:79:7b'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping nas ip-address '10.1.1.3'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping nas mac-address 'e4:1d:2d:12:32:40'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping pikvm ip-address '10.1.1.52'
set service dhcp-server shared-network-name SERVERS subnet 10.1.1.0/24 static-mapping pikvm mac-address 'e4:5f:01:e4:93:32'

# Trusted VLAN
set service dhcp-server shared-network-name TRUSTED authoritative
set service dhcp-server shared-network-name TRUSTED ping-check
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 default-router '10.1.2.1'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 domain-name 'greyrock.io'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 lease '86400'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 range 0 start '10.1.2.200'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 range 0 stop '10.1.2.254'
set service dhcp-server shared-network-name TRUSTED ntp-server 10.1.2.1
set service dhcp-server shared-network-name TRUSTED domain-search greyrock.io
set service dhcp-server shared-network-name TRUSTED domain-search greyrock.casa

set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping andys-desktop ip-address '10.1.2.11'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping andys-desktop mac-address '2c:f0:5d:ad:e5:b4'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping todds-desktop ip-address '10.1.2.10'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping todds-desktop mac-address '74:56:3c:61:39:3f'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping formalsittingroom-appletv ip-address '10.1.2.12'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping formalsittingroom-appletv mac-address 'c0:95:6d:7a:fa:04'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping gameroom-appletv ip-address '10.1.2.13'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping gameroom-appletv mac-address 'c0:95:6d:84:44:85'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping office-appletv ip-address '10.1.2.14'
set service dhcp-server shared-network-name TRUSTED subnet 10.1.2.0/24 static-mapping office-appletv mac-address 'c0:95:6d:82:42:2b'

# Wireless VLAN
set service dhcp-server shared-network-name WIRELESS authoritative
set service dhcp-server shared-network-name WIRELESS ping-check
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 default-router '10.1.5.1'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 domain-name 'greyrock.io'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 lease '86400'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 range 0 start '10.1.5.200'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 range 0 stop '10.1.5.254'
set service dhcp-server shared-network-name WIRELESS ntp-server 10.1.5.1
set service dhcp-server shared-network-name WIRELESS domain-search greyrock.io
set service dhcp-server shared-network-name WIRELESS domain-search greyrock.casa

set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping andys-iphone ip-address '10.1.5.14'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping andys-iphone mac-address '44:90:bb:c9:44:79'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping andys-ipad ip-address '10.1.5.21'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping andys-ipad mac-address '70:72:fe:16:57:65'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping downstairs-bathroom-homepod ip-address '10.1.5.16'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping downstairs-bathroom-homepod mac-address '94:ea:32:a1:15:65'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping formalsittingroom-homepod-left ip-address '10.1.5.15'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping formalsittingroom-homepod-left mac-address 'ac:bc:b5:ec:05:d5'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping formalsittingroom-homepod-right ip-address '10.1.5.22'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping formalsittingroom-homepod-right mac-address 'ac:bc:b5:ea:2d:e3'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping gameroom-homepod-left ip-address '10.1.5.24'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping gameroom-homepod-left mac-address 'ac:bc:b5:ea:0e:ef'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping gameroom-homepod-right ip-address '10.1.5.25'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping gameroom-homepod-right mac-address 'ac:bc:b5:e8:5e:57'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping garage-homepod ip-address '10.1.5.17'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping garage-homepod mac-address 'a4:cf:99:b0:1b:f7'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping kitchen-homepod ip-address '10.1.5.18'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping kitchen-homepod mac-address 'e0:2b:96:8d:05:c4'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping masterbedroom-homepod ip-address '10.1.5.19'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping masterbedroom-homepod mac-address 'e0:2b:96:9f:e9:bc'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping office-homepod-left ip-address '10.1.5.23'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping office-homepod-left mac-address '94:ea:32:a2:a1:d5'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping office-homepod-right ip-address '10.1.5.20'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping office-homepod-right mac-address '4c:20:b8:de:46:e8'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping todds-iphone ip-address '10.1.5.11'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping todds-iphone mac-address '80:b9:89:8d:87:3f'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping todds-macbook ip-address '10.1.5.10'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping todds-macbook mac-address '60:3e:5f:49:40:f0'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping todds-ipad ip-address '10.1.5.12'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping todds-ipad mac-address '7c:2a:ca:81:b3:fd'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping todds-watch ip-address '10.1.5.13'
set service dhcp-server shared-network-name WIRELESS subnet 10.1.5.0/24 static-mapping todds-watch mac-address '40:92:1a:30:40:f8'

# Video VLAN
set service dhcp-server shared-network-name VIDEO authoritative
set service dhcp-server shared-network-name VIDEO ping-check
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 default-router '10.1.4.1'
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 domain-name 'greyrock.io'
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 lease '86400'
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 name-server '10.5.0.4'
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 range 0 start '10.1.4.200'
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 range 0 stop '10.1.4.254'
set service dhcp-server shared-network-name VIDEO ntp-server 10.1.4.1

set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 static-mapping courtyard-porch-doorbell ip-address '10.1.4.12'
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 static-mapping courtyard-porch-doorbell mac-address 'ec:71:db:9b:de:a9'
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 static-mapping garage-camera ip-address '10.1.4.10'
set service dhcp-server shared-network-name VIDEO subnet 10.1.4.0/24 static-mapping garage-camera mac-address '24:52:6a:1f:f9:c4'
