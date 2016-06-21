###################################
#Description
#  This class will prepare the configuration of the tigervnc server.
class tigervnc::config {

  #Configure tigervnc for the users and display you specify in the config_data array.
  tigervnc::tigervnc_user_config{ $tigervnc::config_data:
  }

}
