# == Class: tigervnc::params
#
# === Description
#
#  All we are using this module for now is to quit if we are not using the right OS or version of the OS.
#
class tigervnc::params{
  $os_major_minor = "${::lsbmajdistrelease}.${::lsbminordistrelease}"
  
  case $::osfamily {
    'RedHat': {
      case $::lsbmajdistrelease {
        '7': {
            #Don't fail :)
          notify{"Setting up TigerVNC for $::osfamily $::lsbmajdistrelease":}
        }
        '6': {
          fail('RHEL 6 not currently supported for tigervnc module.')
        }
        default: {
          fail('OS Version not currently supported tigervnc module.')
        }
      }
    }
    default: {
      fail("OS Version: $::osfamily  not currently supported tigervnc module.")
    }
  }
}

