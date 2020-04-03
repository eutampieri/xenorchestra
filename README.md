# Xen-Orchestra (Community Edition) Installer

Xen-Orchestra (Community Edition) allows you to administer Citrix XenServer and XCP-ng as well as backup any VM's running on these systems. 

The single line installation script allows you to go from a bare-minimal installation of [Ubuntu](https://ubuntu.com/download/server) or [Debian (Server)](https://www.debian.org/distrib/netinst) to fully operational XOCE server. Run the following steps from a root shell.

    curl https://raw.githubusercontent.com/Jarli01/xenorchestra_installer/master/xo_install.sh | sudo bash
    <password>
    
The default username and password are applied, admin@admin.net and admin for the password
    
If you don't want NFS capabilities run ```sudo apt-get remove nfs-common```.

* Do not use LAMP
* SSH Access is optional, but highly recommended

# Declaration

This script automates the manual process which can be [found here](https://xen-orchestra.com/docs/from_the_sources.html) as well as removes a few feature restrictions that otherwise would need to be changed manually if following the manual installation process. This script is not officially supported by the Vates team, but is supported by this community. 

# Problems?

Check out our [Troubleshooting Page](https://github.com/Jarli01/xenorchestra_installer/blob/master/TROUBLESHOOTING.md)!

# Goals/Backstory for this script

I'm often asked "why can't this be run on CentOS or Fedora" to which my only reply is and has ever been: The goal was to be the XCP-ng of XS. Which means I wanted a solution that offered as much as XOA offers, while using what is available freely and from open sources. Without restrictions. 

That isn't to say that this installation script won't work on other distributions, please contribute and help us to spread XOCE to other platforms. 

Initially my goal was to simply setup and start using XOCE for a tiny production shop to be able to use an open source hypervisor (Citrix XenServer at the time) and have a management tool/backup solution. Which was initially [NAUBackup](https://github.com/NAUbackup/VmBackup) and XenCenter, when I found XOA and that there was an open source management solution and backup solution that wasn't script based I jumped for it, taking the manual installation process provided by Olivier and his team and automating it. 

That goal transformed into the desire to assist the developers of XOA by using and hopefully finding any bugs or quirks that needed to be worked out while staying in line with the original goal of being as nearly compatibile as possible to XOA.

While the goal initially was to have a solution as close to XOA as possible, with the script came the ability and goal to automate the installation. This is a big deal for these scripts today, while providing an as near-match solution to XOA as possible. 

To keep XOCE up to date I recommend that anyone who's used this installation script or the sources installation to use this: https://github.com/Jarli01/xenorchestra_updater


