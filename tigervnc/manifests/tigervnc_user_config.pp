#Description:
#  This is a resource for configuring a users .vnc directory and service...
#
#Parameters:
#
#  $config_data expects a string that it will split on the ':' to assign index 0 to the user and the index 1 to the display.
#
#Example:
#  To setup vnc for the user blah on display 1:
#  tigervnc::tigervnc_user_config{ 'blah:1':
#    $config_data     =>  'blah:1', 
#  }
#
define tigervnc::tigervnc_user_config( $config_data = $title ) {

    $split = split($config_data,':')
    $vnc_user = $split[0]
    $display = $split[1]

    notify{"User: $vnc_user  Display: $display":}


    #Configure the directory
    file { "/home/$vnc_user/.vnc/":
      ensure  => 'directory',
      group   => $vnc_user,
      mode    => '755',
      owner   => $vnc_user,
      require => User[$vnc_user],
    } ->
    #Create the xstartup 
    file { "/home/$vnc_user/.vnc/xstartup":
      ensure  => 'file',
      group   => $vnc_user,
      mode    => '755',
      owner   => $vnc_user,
      source =>  'puppet:///modules/tigervnc/home/user/.vnc/xstartup',
    } ->
    file { "/home/$vnc_user/.vnc/passwd":
      ensure  => 'file',
      group   => $vnc_user,
      mode    => '600',
      owner   => $vnc_user,
      source =>  'puppet:///modules/tigervnc/home/user/.vnc/passwd',
    } ->
    file { "/etc/systemd/system/vncserver@:$display.service":
      ensure  => 'file',
      group   => 'root',
      mode    => '755',
      owner   => 'root',
      content => template('tigervnc/etc/systemd/system/vncserver@:1.service.erb'),
    } ~>
    exec { "Reload services for systemd post $vnc_user user setup":
      command => "/usr/bin/systemctl daemon-reload",
    } ~>
    #Start and enable the service.
    service { "vncserver@:$display.service":
      ensure  => 'running',
      enable  => true,
      
    }
}
