#!/bin/bash
##############
#Script Name:
#Created By:
#Created Date:
#Last Modified on:
#Purpose:
#
##################################
#
#Functions#


# Create the backup file
mkdir /var/tmp/patch
rm -rf /var/tmp/patch/*
opfile="/var/tmp/patch/`hostname`_patch_bkp_`date +%F`"
touch ${opfile}
#
# Hostname
echo "Hostname: `hostname`" > ${opfile}
# Check current Kernel version:
echo "Kernel_version: `uname -r`" >> ${opfile}
# Mount Points
df -mT|grep -v 'tmpfs' >> ${opfile}
echo "number_of_Mountpoints: `df -mT|grep -v tmpfs|wc -l`" >> ${opfile}
# IP Address
echo "IP ADDRESS" >> ${opfile}
ip a >> ${opfile}
#Routing Table
echo "Routing Table" >> ${opfile}
netstat -nr >> ${opfile}
#Service list
echo "Services_List" >> ${opfile}
systemctl >> ${opfile}
echo "Number_of_Services: `systemctl | wc -l`" >> ${opfile}
#Kernel Parameters
echo "Kernel_parameter" >> ${opfile}
sysctl -a >> ${opfile}
#Firewall Status
echo "Firewall_status: `firewall-cmd --state`" >> ${opfile}
echo "Firewall_Zones" >> ${opfile}
firewall-cmd --list-all >> ${opfile}
#status and mode of SElinux
echo "Status_of_Selinux" >> ${opfile}
sestatus >> ${opfile}
echo "Selinux_context_mode" >> ${opfile}
sestatus -v >> ${opfile}
#java Version
echo "Java_version" >> ${opfile}
java -version >> ${opfile}