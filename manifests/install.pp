class console_tools::install {
    package { $console_tools::params::package_name:
        ensure => present,
    }
}
