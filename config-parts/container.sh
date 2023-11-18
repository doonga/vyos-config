#!/bin/vbash

# Container networks
set container network containers prefix '10.5.0.0/24'

# cloudflare-ddns
set container name cloudflare-ddns allow-host-networks
set container name cloudflare-ddns environment CF_API_TOKEN value "${SECRET_CLOUDFLARE_DYNDNS_TOKEN}"
set container name cloudflare-ddns environment DOMAINS value 'ipv4.greyrock.io'
set container name cloudflare-ddns environment IP6_PROVIDER value "none"
set container name cloudflare-ddns environment TZ value 'America/New_York'
set container name cloudflare-ddns environment PGID value "1000"
set container name cloudflare-ddns environment PUID value "1000"
set container name cloudflare-ddns image 'docker.io/favonia/cloudflare-ddns:1.11.0'
set container name cloudflare-ddns memory '0'
set container name cloudflare-ddns restart 'on-failure'
set container name cloudflare-ddns shared-memory '0'

# bind
set container name bind cap-add 'net-bind-service'
set container name bind image 'docker.io/internetsystemsconsortium/bind9:9.19'
set container name bind command '/usr/sbin/named -4 -f -c /etc/bind/named.conf -u bind'
set container name bind memory '0'
set container name bind network containers address '10.5.0.3'
set container name bind restart 'on-failure'
set container name bind shared-memory '0'
set container name bind volume config destination '/etc/bind'
set container name bind volume config source '/config/containers/bind/config'
set container name bind volume config mode 'ro'
set container name bind volume cache source '/tmp/bind/cache'
set container name bind volume cache destination '/var/cache/bind'
set container name bind volume cache mode 'rw'

# dnsdist
set container name dnsdist cap-add 'net-bind-service'
set container name dnsdist environment TZ value 'America/New_York'
set container name dnsdist image 'docker.io/powerdns/dnsdist-18:1.8.2'
set container name dnsdist arguments '--log-timestamps'
set container name dnsdist memory '0'
set container name dnsdist network containers address '10.5.0.4'
set container name dnsdist restart 'on-failure'
set container name dnsdist shared-memory '0'
set container name dnsdist volume config source '/config/containers/dnsdist/config/dnsdist.conf'
set container name dnsdist volume config destination '/etc/dnsdist/dnsdist.conf'
set container name dnsdist volume config mode 'ro'

# wildcard certificate
set container name lego-auto image 'ghcr.io/bjw-s/lego-auto:v0.2.0'
set container name lego-auto memory '0'
set container name lego-auto allow-host-networks
set container name lego-auto shared-memory '0'
set container name lego-auto restart 'on-failure'
set container name lego-auto environment TZ value 'America/New_York'
set container name lego-auto environment LA_DATADIR value '/config'
set container name lego-auto environment LA_CACHEDIR value '/config/.cache'
set container name lego-auto environment LA_EMAIL value 'postmaster@greyrock.io'
set container name lego-auto environment LA_PROVIDER value 'cloudflare'
set container name lego-auto environment LA_DOMAINS value '*.greyrock.io'
set container name lego-auto environment CF_DNS_API_TOKEN value "${SECRET_CLOUDFLARE_DYNDNS_TOKEN}"
set container name lego-auto volume datadir source '/config/secrets/certs/_.greyrock.io'
set container name lego-auto volume datadir destination '/config'
set container name lego-auto volume datadir mode 'rw'

# pihole/unbound
set container name pihole image 'ghcr.io/szinn/pihole-unbound:2023.10.0'
set container name pihole memory '0'
set container name pihole network containers address '10.5.0.7'
set container name pihole shared-memory '0'
set container name pihole restart 'on-failure'
set container name pihole environment TZ value 'America/New_York'
set container name pihole environment HOSTNAME value 'pihole'
set container name pihole environment PIHOLE_DOMAIN value 'greyrock.io'
set container name pihole environment WEBPASSWORD value "${SECRET_PIHOLE_WEBPASSWORD}"
set container name pihole environment WEBTHEME value 'default-auto'
set container name pihole environment DNSSEC value 'true'
set container name pihole environment DNS_BOGUS_PRIV value 'true'
set container name pihole environment DNS_FQDN_REQUIRED value 'true'
set container name pihole environment DNSMASQ_LISTENING value 'single'
set container name pihole environment FTLCONF_LOCAL_IPV4 value '10.5.0.7'
set container name pihole environment FTLCONF_BLOCK_ICLOUD_PR value 'false'
set container name pihole environment REV_SERVER value 'true'
set container name pihole environment REV_SERVER_DOMAIN value 'greyrock.io'
set container name pihole environment REV_SERVER_TARGET value '10.5.0.3'
set container name pihole environment REV_SERVER_CIDR value '10.0.0.0/8'
set container name pihole environment PIHOLE_DNS_ value '127.0.0.1#5335'
set container name pihole volume pihole source '/config/containers/pihole/pihole'
set container name pihole volume pihole destination '/etc/pihole'
set container name pihole volume pihole mode 'rw'
set container name pihole volume dnsmasq source '/config/containers/pihole/dnsmasq'
set container name pihole volume dnsmasq destination '/etc/dnsmasq.d'
set container name pihole volume dnsmasq mode 'rw'
set container name pihole volume pihole-ssl source '/config/containers/pihole/10-pihole-ssl.conf'
set container name pihole volume pihole-ssl destination '/etc/lighttpd/conf-enabled/10-pihole-ssl.conf'
set container name pihole volume pihole-ssl mode 'rw'
set container name pihole volume certificate-pem source '/config/secrets/certs/_.greyrock.io/combined.pem'
set container name pihole volume certificate-pem destination '/etc/lighttpd/certs/pihole.pem'
set container name pihole volume certificate-pem mode 'ro'

# haproxy-k8s-api
set container name haproxy-k8s-api image 'docker.io/library/haproxy:2.8.4'
set container name haproxy-k8s-api memory '0'
set container name haproxy-k8s-api network containers address '10.5.0.2'
set container name haproxy-k8s-api restart 'on-failure'
set container name haproxy-k8s-api shared-memory '0'
set container name haproxy-k8s-api volume config source '/config/containers/haproxy/config/haproxy.cfg'
set container name haproxy-k8s-api volume config destination '/usr/local/etc/haproxy/haproxy.cfg'
set container name haproxy-k8s-api volume config mode 'ro'

# node-exporter
set container name node-exporter environment procfs value '/host/proc'
set container name node-exporter environment rootfs value '/host/rootfs'
set container name node-exporter environment sysfs value '/host/sys'
set container name node-exporter image 'quay.io/prometheus/node-exporter:v1.7.0'
set container name node-exporter memory '0'
set container name node-exporter allow-host-networks
set container name node-exporter restart 'on-failure'
set container name node-exporter shared-memory '0'
set container name node-exporter volume procfs destination '/host/proc'
set container name node-exporter volume procfs mode 'ro'
set container name node-exporter volume procfs source '/proc'
set container name node-exporter volume rootfs destination '/host/rootfs'
set container name node-exporter volume rootfs mode 'ro'
set container name node-exporter volume rootfs source '/'
set container name node-exporter volume sysfs destination '/host/sys'
set container name node-exporter volume sysfs mode 'ro'
set container name node-exporter volume sysfs source '/sys'

# speedtest-exporter
set container name speedtest-exporter image 'ghcr.io/miguelndecarvalho/speedtest-exporter:v3.5.4'
set container name speedtest-exporter memory '0'
set container name speedtest-exporter allow-host-networks
set container name speedtest-exporter restart 'on-failure'
set container name speedtest-exporter shared-memory '0'

# udp-broadcast-relay-mdns
set container name udp-broadcast-relay-mdns allow-host-networks
set container name udp-broadcast-relay-mdns cap-add 'net-raw'
set container name udp-broadcast-relay-mdns environment CFG_DEV value 'eth5.10;eth5.20;eth5.40;eth5.60'
set container name udp-broadcast-relay-mdns environment CFG_ID value '2'
set container name udp-broadcast-relay-mdns environment CFG_MULTICAST value '224.0.0.251'
set container name udp-broadcast-relay-mdns environment CFG_PORT value '5353'
set container name udp-broadcast-relay-mdns environment SEPARATOR value ';'
set container name udp-broadcast-relay-mdns image 'ghcr.io/onedr0p/udp-broadcast-relay-redux:1.0.27'
set container name udp-broadcast-relay-mdns memory '0'
set container name udp-broadcast-relay-mdns restart 'on-failure'
set container name udp-broadcast-relay-mdns shared-memory '0'

# bind-exporter
set container name bind-exporter arguments '--bind.stats-url http://10.5.0.3:8080 --bind.stats-groups server,view'
set container name bind-exporter image 'quay.io/prometheuscommunity/bind-exporter:v0.7.0'
set container name bind-exporter network containers address '10.5.0.8'
set container name bind-exporter memory '0'
set container name bind-exporter restart 'on-failure'
set container name bind-exporter shared-memory '0'

# registry - docker.io
set container name registry-docker-io image 'docker.io/library/registry:2'
set container name registry-docker-io memory '0'
set container name registry-docker-io shared-memory '0'
set container name registry-docker-io environment REGISTRY_PROXY_REMOTEURL value 'https://docker.io'
set container name registry-docker-io network containers address '10.5.0.10'
set container name registry-docker-io volume cache source '/config/containers/registry/docker-io'
set container name registry-docker-io volume cache destination '/var/lib/registry'
set container name registry-docker-io volume cache mode 'rw'

# registry - registry.k8s.io
set container name registry-registry-k8s-io image 'docker.io/library/registry:2'
set container name registry-registry-k8s-io memory '0'
set container name registry-registry-k8s-io shared-memory '0'
set container name registry-registry-k8s-io environment REGISTRY_PROXY_REMOTEURL value 'https://registry.k8s.io'
set container name registry-registry-k8s-io network containers address '10.5.0.11'
set container name registry-registry-k8s-io volume cache source '/config/containers/registry/registry-k8s-io'
set container name registry-registry-k8s-io volume cache destination '/var/lib/registry'
set container name registry-registry-k8s-io volume cache mode 'rw'

# registry - gcr.io
set container name gcr-io image 'docker.io/library/registry:2'
set container name gcr-io memory '0'
set container name gcr-io shared-memory '0'
set container name gcr-io environment REGISTRY_PROXY_REMOTEURL value 'https://gcr.io'
set container name gcr-io network containers address '10.5.0.12'
set container name gcr-io volume cache source '/config/containers/registry/gcr-io'
set container name gcr-io volume cache destination '/var/lib/registry'
set container name gcr-io volume cache mode 'rw'

# registry - ghcr.io
set container name registry-ghcr-io image 'docker.io/library/registry:2'
set container name registry-ghcr-io memory '0'
set container name registry-ghcr-io shared-memory '0'
set container name registry-ghcr-io environment REGISTRY_PROXY_REMOTEURL value 'https://ghcr.io'
set container name registry-ghcr-io network containers address '10.5.0.13'
set container name registry-ghcr-io volume cache source '/config/containers/registry/ghcr-io'
set container name registry-ghcr-io volume cache destination '/var/lib/registry'
set container name registry-ghcr-io volume cache mode 'rw'

# registry - quay.io
set container name registry-quay-io image 'docker.io/library/registry:2'
set container name registry-quay-io memory '0'
set container name registry-quay-io shared-memory '0'
set container name registry-quay-io environment REGISTRY_PROXY_REMOTEURL value 'https://quay.io'
set container name registry-quay-io network containers address '10.5.0.14'
set container name registry-quay-io volume cache source '/config/containers/registry/quay-io'
set container name registry-quay-io volume cache destination '/var/lib/registry'
set container name registry-quay-io volume cache mode 'rw'

# netboot.xyz
set container name netboot-xyz image 'ghcr.io/netbootxyz/netbootxyz:0.6.8-nbxyz4'
set container name netboot-xyz memory '0'
set container name netboot-xyz allow-host-networks
#remove this if it breaks
set container name netboot-xyz cap-add 'net-bind-service'
set container name netboot-xyz restart 'on-failure'
set container name netboot-xyz shared-memory '0'
