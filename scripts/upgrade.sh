#!/usr/bin/env bash
printf "Completing installation.."

printf "Turning off Satellite shit"

sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/subscription-manager.conf

yum check-update

yum -y update


