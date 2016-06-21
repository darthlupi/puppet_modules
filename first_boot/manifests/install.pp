#Description:
# This class is used to install any of the firstboot utilities.
#
#

class firstboot::install {

  #Network configuration script
  file { '/usr/local/bin/configure_network.sh':
    ensure   => 'file',
    group    => 'root',
    mode     => '700',
    owner    => 'root',
    content => file('firstboot/usr/local/bin/configure_network.sh'),
  }
  #Service that acts as a first boot to run the network configuration script in auto mode.
  file { '/etc/systemd/system/firstboot.service':
    ensure   => 'file',
    group    => 'root',
    mode     => '700',
    owner    => 'root',
    content => file('firstboot/etc/systemd/system/firstboot.service'),
  }
  #Network configuration script
  file { '/usr/local/bin/firstboot.sh':
    ensure   => 'file',
    group    => 'root',
    mode     => '700',
    owner    => 'root',
    content => file('firstboot/usr/local/bin/firstboot.sh'),
  }


}
