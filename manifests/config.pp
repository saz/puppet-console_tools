class console_tools::config {
    file { $console_tools::params::config_name:
        owner   => root,
        group   => root,
        mode    => 644,
        source  => 'puppet:///modules/console_tools/config',
        require => Class['console_tools::install'],
    }

    file { $console_tools::params::config_dir:
        owner   => root,
        group   => root,
        recurse => true,
        purge   => true,
        force   => true,
        require => Class['console_tools::install'],
    }
}
