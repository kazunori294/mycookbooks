#!/bin/sh

IPADDRESS=`/sbin/ifconfig eth0 | grep 'inet addr:' | sed -e 's/^.*inet addr://' -e 's/ .*//'`
CURHOST=`hostname`
AFHOST=`curl -# http://lab-infra01.kazutan.info/get_hostname?ipaddress=${IPADDRESS}`
SUBNET=`/sbin/ifconfig eth0 | grep 'inet addr:' | sed -e 's/^.*Mask://' -e 's/ .*//'`
MACADDRESS=`/sbin/ifconfig eth0 | grep 'HWaddr' | sed -e 's/^.*HWaddr //' -e 's/ .*//'`
OS=`cat /etc/redhat-release | sed "s/ /+/g"`
KERNEL=`uname -r | sed "s/ /+/g"`
UPTIME=`uptime | awk '{print $3,$4,$5}' | sed "s/,//g" | sed "s/ /+/g"`
CPUFM=`cat /proc/cpuinfo | grep "model name" | awk -F":" '{print $2}' | sed "s/ /+/g"`
CPUNUM=`cat /proc/cpuinfo | grep processor | wc -l`
MEM=`cat /proc/meminfo | grep MemTotal | awk '{print $2,$3}' | sed "s/ /+/g"`

curl -# "lab-infra01.kazutan.info/reg_api?hostname=${CURHOST}&ipaddress=${IPADDRESS}&subnet=${SUBNET}&macaddress=${MACADDRESS}&os=${OS}&kernel=${KERNEL}&uptime=${UPTIME}&cpufm=${CPUFM}&cpunum=${CPUNUM}&mem=${MEM}"


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
