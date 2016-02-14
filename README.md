# README.md

Taking a lot of the work that Bob Plankers has done over at [The Lone Sysadmin](https://lonesysadmin.net/2013/03/26/preparing-linux-template-vms/). I've created a couple of scripts to allow for VMware customization of CentOS 7 VMs. 

Both scirpts do the following:
* Stop rsyslog and auditd
* Remove old kernels
* Clean up yum
* Rotate and clear logfiles
* Clear up persistent devices (networking issue)
* remove SSH keys
* remove kickstart configs
* clear root's history
* power off the VM

The script titled cust-plus-open-tools.sh will also install open-vmtools which as of version xx supports guest customization. Execute this script after installation by running the following:

`
curl https://raw.githubusercontent.com/timmycarr/centos7-vmware-custprep/master/cust-plus-open-tools.sh | sh
`
