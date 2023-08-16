#!/bin/vbash

set system domain-name 'greyrock.io'
set system host-name 'gateway'

set system login user vyos authentication public-keys personal key 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDHh+0z1ZlAubCwbz73a4dD2jUvtIKTBF4j8VuiNYhfk9+pfJmb+Qrgl4OnWsKhHSpB+5r3w7DOM0cj/E1uB2O0ScVBZ/a6A2XcOvc9eD0PDXYtgdNnD+T4WbWlUs6UrOTlvlMlXB6hOducuVh60DDcH8E8i1vSTWIWvSG0/1evpkgVxmFjtuLel1a/nWoKLl+4a0VwDrWm2msxlEBVAY7O5vIbcj8UWsAU02+xGXMZcem24f5b+/g1OssyelxuLvZ5+oVfqixWpM1drMXTv1b319WJ2ZJKsokFcr4CciaIGOXznV+k5d1wVgiSlJ8LE3aPCnYVj8LWSwK4mowrWpo0evlb1TqUZE3cA4UY2LMFvlgsZL4S9NsuMasKQH+0Bu8yIQKACLPdUwIrRC63RFNIZqlwqVYkgW+KqUtY4REwTVjHtoMldBMfU3G3PT17Ha+Om2il6BHAPRar2VQmyzIEm/7YEofVIY8fbJjUeigP2k1/5Yx7vJ77OEFzp1rKMEEvUeSd7gaPdzTOVhUwAdOyaSMkpHUS9B2vzCgcteOJZCHjmgz7EdO+2uf2Cts0mhAhX5Flmg6ojx6DXmabdrUUeTJTnUcO0iTziOmsMXpYIclXoysWfPx68GxZ/v/6ojok+wtIOV+Dmtg4+LoaqUuoIRQTSXYw1fJdxuAya3Jf5Q=='
set system login user vyos authentication public-keys personal type 'ssh-rsa'

set system name-server '1.1.1.1'

set system sysctl parameter kernel.pty.max value '24000'

set system acceleration qat

set system syslog global facility all level info
set system syslog host 10.45.0.2 facility kern level 'warning'
set system syslog host 10.45.0.2 protocol 'tcp'
set system syslog host 10.45.0.2 port '6001'
set system syslog host 10.45.0.2 format octet-counted

set system task-scheduler task backup-config crontab-spec '30 0 * * *'
set system task-scheduler task backup-config executable path '/config/scripts/custom-config-backup.sh'

set system time-zone 'America/New_York'
