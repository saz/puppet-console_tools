class console_tools::params {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $package = 'console-tools'
      $config_dir = '/etc/console-tools/'
      $config_file = "${config_dir}config"
      $config_source = 'puppet:///modules/console_tools/config',
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
