; Make sure to update the epoch time in the SOA records so coreDNS picks up the changes automatically
; https://www.epochconverter.com/

; SOA Records
$TTL 3600
$ORIGIN greyrock.io.
@ 3600 IN SOA gateway.greyrock.io. gateway.greyrock.io. (
  1682960273         ; serial number (epoch timestamp)
  7200               ; refresh period
  3600               ; retry period
  1209600            ; expire time
  3600               ; minimum ttl
)

; NS Records
@                                   IN  NS gateway.greyrock.io.

; LAN
gateway                             IN  A  10.1.0.1
fsr-switch-media                    IN  A  10.1.0.22
gameroom-switch-1-gb                IN  A  10.1.0.18
gameroom-switch-2-5-gb              IN  A  10.1.0.13
gameroom-switch-media               IN  A  10.1.0.21
gameroom-access-point               IN  A  10.1.0.15
garage-switch                       IN  A  10.1.0.10
kitchen-access-point                IN  A  10.1.0.16
office-switch-8                     IN  A  10.1.0.12
office-switch-10-gb                 IN  A  10.1.0.19
office-switch-24                    IN  A  10.1.0.11
office-switch-media                 IN  A  10.1.0.20
outdoor-access-point                IN  A  10.1.0.17
upstairs-access-point               IN  A  10.1.0.14

; Servers
gateway-ipmi                        IN  A  10.1.1.50
nas                                 IN  A  10.1.1.3
nas-ipmi                            IN  A  10.1.1.51
k8s1                                IN  A  10.1.1.4
k8s2                                IN  A  10.1.1.5
k8s3                                IN  A  10.1.1.6
k8s4                                IN  A  10.1.1.7
k8s5                                IN  A  10.1.1.8
k8s6                                IN  A  10.1.1.9
oc300                               IN  A  10.1.1.11
pikvm                               IN  A  10.1.1.52

; NTP
time1                             IN  A  10.1.7.2
time2                             IN  A  10.1.7.3
time3                             IN  A  10.1.7.4
time4                             IN  A  10.1.7.5

; IOT
ambient-ws5000                      IN  A  10.1.3.38
basement-iotawatt                   IN  A  10.1.3.40
brother-printer                     IN  A  10.1.3.13
canon-printer                       IN  A  10.1.3.42
downstairs-litter-robot             IN  A  10.1.3.33
fsr-lg-tv                           IN  A  10.1.3.32
gameroom-ps4                        IN  A  10.1.3.11
gameroom-ps5                        IN  A  10.1.3.10
gameroom-samsung-tv-left            IN  A  10.1.3.29
gameroom-samsung-tv-right           IN  A  10.1.3.26
garage-iotawatt                     IN  A  10.1.3.39
garage-door-andy                    IN  A  10.1.3.35
garage-door-todd                    IN  A  10.1.3.34
hvac-dining-room                    IN  A  10.1.3.23
hvac-game-room                      IN  A  10.1.3.24
hvac-kitchen                        IN  A  10.1.3.22
hvac-master-bedroom                 IN  A  10.1.3.21
hvac-office                         IN  A  10.1.3.20
hydrawise-sprinkler-controller      IN  A  10.1.3.25
k8s4-iot                            IN  A  10.1.3.7
k8s5-iot                            IN  A  10.1.3.8
k8s6-iot                            IN  A  10.1.3.9
myq-f99-homekit                     IN  A  10.1.3.43
office-hs110-rack                   IN  A  10.1.3.37
office-samsung-tv                   IN  A  10.1.3.30
solaredge-inverter                  IN  A  10.1.3.199
nintendo-switch-todd                IN  A  10.1.3.12
slzb-06                             IN  A  10.1.3.36
teslawallconnector-todd             IN  A  10.1.3.41
tesla-model-3-todd                  IN  A  10.1.3.28
upstairs-litter-robot               IN  A  10.1.3.31
withings-scale                      IN  A  10.1.3.27

; Trusted
andys-desktop                       IN  A  10.1.2.11
todds-desktop                       IN  A  10.1.2.10
fsr-appletv                         IN  A  10.1.2.12
gameroom-appletv                    IN  A  10.1.2.13
office-appletv                      IN  A  10.1.5.14

; Wireless
andys-iphone                        IN  A  10.1.5.14
andys-ipad                          IN  A  10.1.5.21
formalsittingroom-homepod-left      IN  A  10.1.5.15
formalsittingroom-homepod-right     IN  A  10.1.5.22
gameroom-homepod                    IN  A  10.1.5.16
garage-homepod                      IN  A  10.1.5.17
kitchen-homepod                     IN  A  10.1.5.18
masterbedroom-homepod               IN  A  10.1.5.19
office-homepod-left                 IN  A  10.1.5.23
office-homepod-right                IN  A  10.1.5.20
todds-iphone                        IN  A  10.1.5.11
todds-macbook                       IN  A  10.1.5.10
todds-ipad                          IN  A  10.1.5.12
todds-watch                         IN  A  10.1.5.13

; Video
courtyard-porch-doorbell            IN  A  10.1.4.12

; Containers
greyrock-ops                        IN  A  10.5.0.2
pihole                              IN  A  10.5.0.7

; CNAME records
auth0                               IN  CNAME  dev-mz0m268gay70grzm-cd-iyni5xx7oczwvdik.edge.tenants.us.auth0.com.
minio                               IN  CNAME  nas.greyrock.io.
s3                                  IN  CNAME  nas.greyrock.io.
vault                               IN  CNAME  nas.greyrock.io.
vpn                                 IN  CNAME  gateway.greyrock.io.
zigbee-coordinator                  IN  CNAME  slzb-06.greyrock.io.
