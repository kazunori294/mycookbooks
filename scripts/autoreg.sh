#!/bin/sh

infradb="10.1.0.106" 
hostname=`hostname`
ipaddress=`/sbin/ifconfig eth0 | grep 'inet addr:' | sed -e 's/^.*inet addr://' -e 's/ .*//'`


curl -# "${infradb}/reg_api?hostname=${hostname}&ipaddress=${ipaddress}"
