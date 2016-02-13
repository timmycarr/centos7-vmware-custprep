#!/bin/bash
#
#Script maintained @ https://github.com/timmycarr/centos7-vmware-custprep
#
#Borrowing liberally from Bob Plankers @ The Lone Sysadmin
#https://lonesysadmin.net/2015/01/06/centos-7-refusing-vmware-vsphere-guest-os-customizations/
#
#
#
#Stop the audid and syslog services to clear out logs
/sbin/service rsyslog stop
/sbin/service auditd stop
#Remove old kernels
/bin/package-cleanup --oldkernels --count=1
#Clean up yum cache
/usr/bin/yum clean all
#Rotate all logs based on /etc/logrotate.conf
/usr/sbin/logrotate –f /etc/logrotate.conf
#Clear log files
/bin/rm –f /var/log/*-???????? /var/log/*.gz
/bin/rm -f /var/log/dmesg.old
/bin/rm -rf /var/log/anaconda
#clean out audit.log wtmp lastlog and grub log
/bin/cat /dev/null > /var/log/audit/audit.log
/bin/cat /dev/null > /var/log/wtmp
/bin/cat /dev/null > /var/log/lastlog
/bin/cat /dev/null > /var/log/grubby
#Remove persistent device rules for networking
/bin/rm -f /etc/udev/rules.d/70*
#Following line is a legacy component from RHEL6 and is broken
#need to test
#/bin/sed -i ‘/^(HWADDR|UUID)=/d’ /etc/sysconfig/network-scripts/ifcfg-eth0
/bin/rm –rf /tmp/*
/bin/rm –rf /var/tmp/*
#Remove system's ssh key files
/bin/rm –f /etc/ssh/*key*
#Remove root's ssh keys that were potentiall generated during the install process
/bin/rm -rf ~root/.ssh/
#Remove kickstart configurations left in the root directory
/bin/rm -f ~root/anaconda-ks.cfg
#Remove script file
/bin/rm -f ./cust-plus-open-tools.sh
#Remove root's history file 
/bin/rm -f ~root/.bash_history
unset HISTFILE
#Shutdown the system
/usr/sbin/shutdown -h now
