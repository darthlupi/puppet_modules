###################################
#Description
#  This class will install the required packages.
#
class tigervnc::install {

  package { 'tigervnc-server':
    ensure => 'installed',
  }
}
