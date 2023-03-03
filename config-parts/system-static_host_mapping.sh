# Gateway
set system static-host-mapping host-name gateway.private.greyrock.io inet 10.1.0.1
set system static-host-mapping host-name gateway.private.greyrock.io alias vpn.greyrock.io
set system static-host-mapping host-name gateway.private.greyrock.io alias ipv4.greyrock.io

# NAS
set system static-host-mapping host-name librarium.private.greyrock.io inet 10.1.1.3
set system static-host-mapping host-name librarium.private.greyrock.io alias nas.private.greyrock.io
set system static-host-mapping host-name librarium.private.greyrock.io alias s3.greyrock.io

# Kubernetes hosts
set system static-host-mapping host-name k8s1.private.greyrock.io inet 10.1.1.4
set system static-host-mapping host-name k8s2.private.greyrock.io inet 10.1.1.5
set system static-host-mapping host-name k8s3.private.greyrock.io inet 10.1.1.6
set system static-host-mapping host-name k8s4.private.greyrock.io inet 10.1.1.7
set system static-host-mapping host-name k8s5.private.greyrock.io inet 10.1.1.8
set system static-host-mapping host-name k8s6.private.greyrock.io inet 10.1.1.9

# Kubernetes cluster VIP
set system static-host-mapping host-name greyrock-ops.private.greyrock.io inet 10.5.0.2

# Other hosts
set system static-host-mapping host-name pikvm.private.greyrock.io inet 10.1.1.52
set system static-host-mapping host-name s3.private.greyrock.io inet 10.1.1.3
