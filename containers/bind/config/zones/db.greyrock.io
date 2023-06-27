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
gameroom-switch                     IN  A  10.1.0.13
gameroom-access-point               IN  A  10.1.0.15
garage-switch                       IN  A  10.1.0.10
kitchen-access-point                IN  A  10.1.0.16
office-switch-8                     IN  A  10.1.0.12
office-switch-24                    IN  A  10.1.0.11
outdoor-access-point                IN  A  10.1.0.7
upstairs-access-point               IN  A  10.1.0.14

; Servers
chronos                             IN  A  10.1.1.2
nas                                 IN  A  10.1.1.3
nas-ipmi                            IN  A  10.1.1.51
k8s1                                IN  A  10.1.1.4
k8s2                                IN  A  10.1.1.5
k8s3                                IN  A  10.1.1.6
k8s4                                IN  A  10.1.1.7
k8s5                                IN  A  10.1.1.8
k8s6                                IN  A  10.1.1.9
gitops                              IN  A  10.1.1.10
oc300                               IN  A  10.1.1.11
pikvm                               IN  A  10.1.1.52

; IOT
ambient-ws5000                      IN  A  10.1.3.198
basement-iotawatt                   IN  A  10.1.3.251
brother-printer                     IN  A  10.1.3.13
diningroom-mitsubishi-inverter      IN  A  10.1.3.203
downstairs-litter-robot             IN  A  10.1.3.193
formalsittingroom-lg-tv             IN  A  10.1.3.192
gameroom-mitsubishi-inverter        IN  A  10.1.3.201
gameroom-ps4                        IN  A  10.1.3.11
gameroom-ps5                        IN  A  10.1.3.10
gameroom-samsung-tv-left            IN  A  10.1.3.189
gameroom-samsung-tv-right           IN  A  10.1.3.186
garage-iotawatt                     IN  A  10.1.3.250
garage-door-andy                    IN  A  10.1.3.195
garage-door-todd                    IN  A  10.1.3.194
hvac-dining-room                    IN  A  10.1.3.23
hvac-game-room                      IN  A  10.1.3.24
hvac-kitchen                        IN  A  10.1.3.22
hvac-master-bedroom                 IN  A  10.1.3.21
hvac-office                         IN  A  10.1.3.20
hydrawise-sprinkler-controller      IN  A  10.1.3.174
kitchen-mitsubishi-inverter         IN  A  10.1.3.200
masterbedroom-mitsubishi-inverter   IN  A  10.1.3.202
office-hs110-rack                   IN  A  10.1.3.197
office-mitsubishi-inverter          IN  A  10.1.3.204
office-samsung-tv                   IN  A  10.1.3.190
solaredge-inverter                  IN  A  10.1.3.199
nintendo-switch-todd                IN  A  10.1.3.12
slzb-06                             IN  A  10.1.3.196
teslawallconnector-todd             IN  A  10.1.3.252
tesla-model-3-todd                  IN  A  10.1.3.188
upstairs-litter-robot               IN  A  10.1.3.191
withings-scale                      IN  A  10.1.3.187

; Trusted
andys-desktop                       IN  A  10.1.2.14
andys-iphone                        IN  A  10.1.2.15
formalsittingroom-appletv           IN  A  10.1.2.25
formalsittingroom-homepod           IN  A  10.1.2.20
gameroom-appletv                    IN  A  10.1.2.24
gameroom-homepod                    IN  A  10.1.2.22
garage-homepod                      IN  A  10.1.2.13
kitchen-homepod                     IN  A  10.1.2.17
masterbedroom-homepod               IN  A  10.1.2.18
office-appletv                      IN  A  10.1.2.23
office-homepod                      IN  A  10.1.2.21
todds-desktop                       IN  A  10.1.2.10
todds-iphone                        IN  A  10.1.2.12
todds-laptop                        IN  A  10.1.2.11
todds-surface                       IN  A  10.1.2.16
todds-applewatch                    IN  A  10.1.2.26

; Video
courtyard-porch-doorbell            IN  A  10.1.4.12

; Containers
greyrock-ops                        IN  A  10.5.0.2

; CNAME records
auth0                               IN  CNAME  dev-mz0m268gay70grzm-cd-iyni5xx7oczwvdik.edge.tenants.us.auth0.com.
zigbee-coordinator                  IN  CNAME  slzb-06.greyrock.io.
s3                                  IN  CNAME  nas.greyrock.io.
vpn                                 IN  CNAME  gateway.greyrock.io.
