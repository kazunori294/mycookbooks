#!/bin/sh

IPADDRESS=`/sbin/ifconfig eth0 | grep 'inet addr:' | sed -e 's/^.*inet addr://' -e 's/ .*//'`
CURHOST=`hostname`
AFHOST=`curl -# http://lab-infra01.kazutan.info/get_hostname?ipaddress=${IPADDRESS}`


curl -# "lab-infra01.kazutan.info/reg_api?hostname=${CURHOST}&ipaddress=${IPADDRESS}"


if test "${CURHOST}" = "${AFHOST}"; then
   echo 'match'
   echo 'no action needed'

else
   echo 'not match'
   hostname ${AFHOST}

   cat << EOF > /etc/sysconfig/network
NETWORKING=yes
HOSTNAME=${AFHOST}
EOF

fi
