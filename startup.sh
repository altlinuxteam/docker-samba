#!/usr/bin/env bash

set -euo pipefail

hostname ${SAMBA_HOSTNAME}
sed -i "s/HOSTNAME=.\*/HOSTNAME=${SAMBA_HOSTNAME}/" /etc/sysconfig/network

samba-tool domain provision --domain=${SAMBA_DOMAIN} --host-name=${SAMBA_HOST} --adminpass=peebieY4 --use-rfc2307 --realm=${SAMBA_REALM}

service samba start

tail -F /var/log/samba/log.*
