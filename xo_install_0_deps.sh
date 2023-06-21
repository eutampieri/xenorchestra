#!/bin/bash

# Check if we were effectively run as root
[ $EUID = 0 ] || { echo "This script needs to be run as root!"; exit 1; }

# Check for required memory
totalk=$(awk '/^MemTotal:/{print $2}' /proc/meminfo)
if [ "$totalk" -lt "2000000" ]; then echo "XOCE Requires at least 2GB Memory!"; exit 1; fi 

distro=$(/usr/bin/lsb_release -is)
if [ "$distro" = "Ubuntu" ]; then /usr/bin/add-apt-repository multiverse; fi

# Ensures that Yarn dependencies are installed
/usr/bin/apt-get update
/usr/bin/apt-get --yes install git curl apt-transport-https gnupg
