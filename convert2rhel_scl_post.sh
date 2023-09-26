#!/bin/bash

. demo.sh/demo.sh

clear

ps1() {
    echo -ne "\033[01;32m${USER}@$(hostname -s) \033[01;34m$(basename $(pwd)) # \033[00m"
}

DEMO_CSIZE=1 DEMO_SPEED=0.05 DEMO_AUTO_TYPE=yes DEMO_NOWAIT=yes
p '# Post installation duties: SCL packages'
pe subscription-manager repos --enable rhel-server-rhscl-7-rpms
pe yum reinstall rh-*
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# CentOS leftovers:'
pe rpm --nodigest -qa --qf="%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\\t%{INSTALLTIME:date}\\t%{VENDOR}\\t%{BUILDHOST}\\n" | fgrep -v 'Red Hat, Inc.'

exit








