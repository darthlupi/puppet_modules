#Description:
#  This class disables the firewall service by OS version.
#
class disable_firewall::service {

  case $::osfamily {
    'RedHat': {
      case $::lsbmajdistrelease {
        '7': {
          service { "disable firewalld":
            name   => 'firewalld',
            enable => false,
            ensure => "stopped",
          }
        }
        '6': {
          service { "disable iptables":
            name   => 'iptables',
            enable => false,
            ensure => "stopped",
          }

        }
        default: {
          service { "disable iptables":
            name   => 'iptables',
            enable => false,
            ensure => "stopped",
          }
        }
      }
    }
    default: {
      fail("OS Version: $::osfamily  not currently supported by disable_firewall module.")
    }
  }


}
