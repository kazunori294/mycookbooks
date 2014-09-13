#!/bin/sh

cat << EOF > /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=$1
EOF
