class console_tools::params {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $package_name = 'console-tools'
            $config_dir = '/etc/console-tools/'
            $config_name = "${config_dir}config"
        }
    }
}
