#!/bin/bash

. demo.sh/demo.sh

clear

ps1() {
    echo -ne "\033[01;32m${USER}@$(hostname -s) \033[01;34m$(basename $(pwd)) # \033[00m"
}

DEMO_CSIZE=1 DEMO_SPEED=0.05 DEMO_AUTO_TYPE=yes DEMO_NOWAIT=yes
p '# A) Ensure system is up to date'
pe yum upgrade -y
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes DEMO_SPEED=0.01
p '# B) Register CentOS to Satellite:'
curl -sS --insecure 'https://satellite.example.local/register?force=true&hostgroup_id=1&location_id=1&operatingsystem_id=8&organization_id=1&setup_insights=false&update_packages=false' -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ0.eyJ0c0VyX0lkIjo0LCJpYXQiOjE0OTU0NDUzMjQsImp0aSI0Ijc0ZGY1ZTQ3MzM0ZWEwMTA0NzAyZTFhMDU0MjAxMGM1OWUyOTczMzI0NDdkYzZjMmNjMDM5NWFlNWUwMGI0ZTEiLCJzY00wZSI0InJlZ0lzdHJhdGlvbiNnbG0iYWwgcmVnaXN0cmF0aW9uI2hvc3QifQ.zNEQ6DhXRJTlv73xPIl1sVZJc8onJYcQhoZLLrNNK1M' | bash
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# C) Install the Convert2RHEL tool:'
pe yum -y install convert2rhel
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# D) Prepopulate katello-ca-consumer:'
pe curl --insecure https://satellite.example.local/pub/katello-ca-consumer-latest.noarch.rpm -o /usr/share/convert2rhel/subscription-manager/katello-ca-consumer-latest.noarch.rpm
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# E) Run Convert2RHEL analyze:'
pe convert2rhel analyze --activationkey "convert2rhel_centos7" --org "Goodfellow" --keep-rhsm
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# F) Run Convert2RHEL:'
pe convert2rhel --activationkey "convert2rhel_centos7" --org "Goodfellow" --keep-rhsm
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes

exit
