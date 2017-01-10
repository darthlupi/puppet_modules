#!/bin/bash
#First boot script

#Attempt to autoconfigure network
/usr/local/bin/configure_network.sh auto

#Disable first boot
systemctl disable firstboot.service
