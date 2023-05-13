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
@                          IN  NS gateway.greyrock.io.

; LAN
gateway                    IN  A  10.1.0.1

; Servers
chronos                    IN  A  10.1.1.2
nas                        IN  A  10.1.1.3
k8s1                       IN  A  10.1.1.4
k8s2                       IN  A  10.1.1.5
k8s3                       IN  A  10.1.1.6
k8s4                       IN  A  10.1.1.7
k8s5                       IN  A  10.1.1.8
k8s6                       IN  A  10.1.1.9
gitops                     IN  A  10.1.1.10
pikvm                      IN  A  10.1.1.52

; IOT
slzb-06                    IN  A  10.1.3.196

; Video
courtyard-porch-doorbell   IN  A  10.1.4.12

; Containers
greyrock-ops               IN  A  10.5.0.2

; CNAME records
auth0                      IN  CNAME dev-mz0m268gay70grzm-cd-iyni5xx7oczwvdik.edge.tenants.us.auth0.com.
zigbee-coordinator         IN  CNAME slzb-06.greyrock.io.
vpn                        IN  CNAME gateway.greyrock.io.
