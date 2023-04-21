# Gateway
set system static-host-mapping host-name gateway.greyrock.io inet 10.1.0.1
set system static-host-mapping host-name gateway.greyrock.io alias vpn.greyrock.io
set system static-host-mapping host-name gateway.greyrock.io alias ipv4.greyrock.io

# NAS
set system static-host-mapping host-name librarium.greyrock.io inet 10.1.1.3
set system static-host-mapping host-name librarium.greyrock.io alias nas.greyrock.io
set system static-host-mapping host-name librarium.greyrock.io alias s3.greyrock.io

# Kubernetes hosts
set system static-host-mapping host-name k8s1.greyrock.io inet 10.1.1.4
set system static-host-mapping host-name k8s2.greyrock.io inet 10.1.1.5
set system static-host-mapping host-name k8s3.greyrock.io inet 10.1.1.6
set system static-host-mapping host-name k8s4.greyrock.io inet 10.1.1.7
set system static-host-mapping host-name k8s5.greyrock.io inet 10.1.1.8
set system static-host-mapping host-name k8s6.greyrock.io inet 10.1.1.9

# Kubernetes cluster VIP
set system static-host-mapping host-name greyrock-ops.greyrock.io inet 10.5.0.2

# Other hosts
set system static-host-mapping host-name gitops.greyrock.io inet 10.1.1.10
set system static-host-mapping host-name pikvm.greyrock.io inet 10.1.1.52
set system static-host-mapping host-name s3.greyrock.io inet 10.1.1.3
set system static-host-mapping host-name courtyard-porch-doorbell.greyrock.io inet 10.1.4.253
