# == Class: firstboot
#
# This class makes sure that the required command line utilities and scripts 
# that are used to configure and test a system are avialable. 
#
# === Parameters
#
# There are no parameters.
#
# === Variables
#
# There are no variables
#
# === Examples
#
#  class { 'firstboot':
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class firstboot {

    include firstboot::install
    include firstboot::service

}
