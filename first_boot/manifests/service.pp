#Description:
#  This class is used to configure any services installed in the install.pp

class firstboot::service {
  #Enable the "first boot" service.
  #This service runs the firstboot.sh script which will attempt to autoconfigure the network based vApp Properties and then
  #disable puppet and the first boot service itself.
  #Do not start.  Just enable it.
  service { 'firstboot.service':
    enable => true,
  }
}
