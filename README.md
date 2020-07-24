# Xen-Orchestra (Community Edition) Installer

Xen-Orchestra (Community Edition) allows you to administer Citrix Hypervisor (aka XenServer) and XCP-ng as well as backup any VM's running on these systems. The single line installation script allows you to go from a bare-minimal installation of [Ubuntu](https://ubuntu.com/download/server) or [Debian (Server)](https://www.debian.org/distrib/netinst) to fully operational XOCE server.

## System Minimum Requirements for installation

* 1 vCPU
* 3 GiB RAM
* 10 GiB disk space

## System recommendations for operation

* 2 vCPU recommended 
* 3 GiB of RAM (for environments containing 500+ VMs increase the amount RAM)
* 20 GiB disk space (for system updates)

## Assumptions

* We assume you have a Virtual or physical server running a currently supported Ubuntu or Debian server installation with internet connectivity
* You've read this community and understand what installation entails and does on your soon to be XOCE server

## Installation
 
Run the following steps from a root shell on your **Ubuntu or Debian** host.

    curl https://raw.githubusercontent.com/Jarli01/xenorchestra_installer/master/xo_install.sh | sudo bash
    <password>
    
The default username and password are applied, admin@admin.net and admin for the password

If you don't want NFS capabilities run ```sudo apt-get remove nfs-common```.

* Do not use LAMP
* SSH Access is optional, but highly recommended

# Declarations

This script automates the manual process which can be [found here](https://xen-orchestra.com/docs/from_the_sources.html) as well as removes a few feature restrictions that otherwise would need to be changed manually if following the manual installation process. This script is not officially supported by the Vates team, but is supported by this community. 

# Prepacked installation

To download and deploy a prepacked Ubuntu 20.04 installation of Xen Orchestra (CE) run the below from an SSH session on your XCP-NG/Citrix Hypervisor (XenServer) host(s)

    bash -c "$(curl -s https://raw.githubusercontent.com/Jarli01/xenorchestra_installer/master/xoce)"

SHA256 Checksum '0ae7e283518f9b12b9a3756c58fbf357aea852df062be842adbb45eb1e42dcec'

For verification of SHA256 checksum the XVA file can be downloaded directly and verified/imported. 
XVA Direct Download https://srv-file19.gofile.io/download/Kt6nJu/20200722T183158Z%20-%20XOCE.xva

To login to the console use:
Username: **XOCE**
Password: **XOCE**

# Self-signed SSL 

If you are running this internally and need SSL (recommended) follow the below steps to create a self-signed SSL key and certificate; while browsers will still say the connection is unsecured, this is because the certificate isn't from a public authority and is on your LAN. Alternatively a reverse proxy can be used for public facing installations.  

## Generate your key and cert from your XOCE installation

    sudo openssl req -x509 -nodes -days 3650 -newkey rsa:4096 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/certificate.pem
    
Now edit the xo-server.toml file

    vi /opt/xen-orchestra/packages/xo-server/.xo-server.toml
    
Comment-out or edit the port from 80 to 443 and add the cert and key to the appropriate locations within this file.
    
    port = 443
    cert = '/etc/ssl/certs/certificate.pem'
    key = '/etc/ssl/private/key.pem'
    
Restart xo-server.service

    systemctl restart xo-server.service

Reload your XOCE website using SSL (https://your-host-ip)

# Problems?

Check out our [Troubleshooting Page](https://github.com/Jarli01/xenorchestra_installer/blob/master/TROUBLESHOOTING.md)!

# Goals/Backstory for this script

I'm often asked "why can't this be run on CentOS or Fedora" to which my only reply is and has ever been: The goal was to be the XCP-ng of XS. Which means I wanted a solution that offered as much as XOA offers, while using what is available freely and from open sources. Without restrictions. 

That isn't to say that this installation script won't work on other distributions, please contribute and help us to spread XOCE to other platforms. 

Initially my goal was to simply setup and start using XOCE for a tiny production shop to be able to use an open source hypervisor (Citrix XenServer at the time) and have a management tool/backup solution. Which was initially [NAUBackup](https://github.com/NAUbackup/VmBackup) and XenCenter, when I found XOA and that there was an open source management solution and backup solution that wasn't script based I jumped for it, taking the manual installation process provided by Olivier and his team and automating it. 

That goal transformed into the desire to assist the developers of XOA by using and hopefully finding any bugs or quirks that needed to be worked out while staying in line with the original goal of being as nearly compatibile as possible to XOA.

While the goal initially was to have a solution as close to XOA as possible, with the script came the ability and goal to automate the installation. This is a big deal for these scripts today, while providing an as near-match solution to XOA as possible. 

To keep XOCE up to date I recommend that anyone who's used this installation script or the sources installation to use this: https://github.com/Jarli01/xenorchestra_updater


