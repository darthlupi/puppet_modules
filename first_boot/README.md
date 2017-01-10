# firstboot

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with firstboot](#setup)
    * [What firstboot affects](#what-firstboot-affects)
4. [Usage - Configuration options and additional functionality](#usage)


## Overview

This module create a firstboot service that will run once then disable itself.
This module is specifically designed for RHEL 7 and CentOS 6.

## Module Description


This module create a firstboot service that will run once then disable itself.
To add custom scripts actions edit the files/usr/local/bin/firstboot.sh script.
This next two lines define what action to take on first boot:

#Attempt to autoconfigure network
/usr/local/bin/configure_network.sh auto

Replace the above two lines with any scripts or commands you want to take place on the firstboot.

## Setup

### What firstboot affects

Firstboot module will create and enable a new service named firstboot.service.
By default it will also create the following files:
/usr/local/bin/firstboot.sh - Used to configure the what script to trigger on first boot and disable the first boot service after initial run.
/usr/local/bin/configure_network.sh - Used to auto configure the network interfaces based on vApp properties.




## Usage

Firstboot has no parameters to customize.
