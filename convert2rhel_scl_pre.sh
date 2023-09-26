#!/bin/bash

. demo.sh/demo.sh

clear

ps1() {
    echo -ne "\033[01;32m${USER}@$(hostname -s) \033[01;34m$(basename $(pwd)) # \033[00m"
}

DEMO_CSIZE=1 DEMO_SPEED=0.05 DEMO_AUTO_TYPE=yes DEMO_NOWAIT=yes
p '# A) Prerequisites: stop important services'
pe systemctl status -n0 rh-nginx120-nginx.service rh-php73-php-fpm.service rh-postgresql13-postgresql
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
pe systemctl disable --now rh-nginx120-nginx.service rh-php73-php-fpm.service rh-postgresql13-postgresql
pe systemctl status -n0 rh-nginx120-nginx.service rh-php73-php-fpm.service rh-postgresql13-postgresql
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# B) Download the Red Hat GPG key:'
pe curl -o /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release https://www.redhat.com/security/data/fd431d51.txt
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# C) Download the SSL certificate of the https://cdn.redhat.com server, which contains the Convert2RHEL repositories:'
pe curl --create-dirs -o /etc/rhsm/ca/redhat-uep.pem https://ftp.redhat.com/redhat/convert2rhel/redhat-uep.pem
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# D) Install the Convert2RHEL repository file:'
pe curl -o /etc/yum.repos.d/convert2rhel.repo https://ftp.redhat.com/redhat/convert2rhel/7/convert2rhel.repo
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# E) Install the Convert2RHEL tool:'
pe yum -y install convert2rhel
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes
p '# F) Run Convert2RHEL analyze:'
#pe time convert2rhel analyze
DEMO_NOWAIT=no
p ''
DEMO_NOWAIT=yes

exit
