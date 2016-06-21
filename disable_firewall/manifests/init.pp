# == Class: disable_firewall
#
#  This module disables the firewall for EL 6 and 7 systems.
#
# === Parameters
#
#  none
#
# === Variables
#
#  none
#
# === Examples
#
#  class { disable_firwall: 
#  }
#
# === Authors
#
# Robert Lupinek 
#
# === Copyright
#
#
class disable_firewall {
  include disable_firewall::service
}
