# == Class: tigervnc
#
# This module installs tigervnc and allows the automatic setup a user's vncserver as a service. 
# This module is currently only configured to work with RHEL 7.
#
# === Parameters
#
#  config_data
#    This variable is an array that is made up of the user and the display separated by a ':'.
#    It is used to loop through the config_user resource to create the needed files and services 
#    to setup tigervnc server to each user and display requested.   
#
# === Variables
#
#  config_data
#    This variable is an array that is made up of the user and the display separated by a ':'.
#    It is used to loop through the config_user resource to create the needed files and services
#    to setup tigervnc server to each user and display requested.
#
# === Examples
# This will configure the vncserver service for user1 on display 1 and user2 on display 2.
#
#  class { 'tigervnc':
#   config_data    => [user1:1,user2:2]
#  }
#
# === Authors
#
# Author Name robert.lupinek@gmail.com 
#
# === Copyright
#
#  Robert Lupinek
#
class tigervnc (
  $config_data   = [],
) inherits tigervnc::params {

  anchor { 'tigervnc::begin': } ->
  class { 'tigervnc::install': } ->
  class { 'tigervnc::config': } ->
  anchor { 'tigervnc::end': }

}
