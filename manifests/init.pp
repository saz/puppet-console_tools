# Class: console_tools
#
# This module manages console-tools settings
#
# Parameters:
#   [*ensure*]
#     Ensure if present or absent.
#     Default: present
#
#   [*autoupgrade*]
#     Upgrade package automatically, if there is a newer version.
#     Default: false
#
#   [*package*]
#     Name of the package.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*config_file*]
#     Main configuration file.
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*config_file_replace*]
#     Replace config file with defined config file
#     Default: true
#
#   [*config_dir*]
#     Destination directory of config file
#     Only set this, if your platform is not supported or you know, what you're doing.
#     Default: auto-set, platform specific
#
#   [*config_dir_purge*]
#     Remove files in config_dir, if they are not managed by puppet
#     Default: true
#
#   [*config_dir_replace*]
#     Replace config files in config_dir
#     Default: true
#
#   [*source*]
#     Source of new config file
#     Default: use config in module
#
# Actions:
#   Installs tzdata and configures timezone
#
# Requires:
#   Nothing
#
# Sample Usage:
#   class { 'timezone':
#     timezone => 'Europe/Berlin',
#   }
#
# [Remember: No empty lines between comments and class definition]
class console_tools(
  $ensure = 'present',
  $autoupgrade = false,
  $package = $console_tools::params::package,
  $config_file = $console_tools::params::config_file,
  $config_file_replace = true,
  $config_dir = $console_tools::params::config_dir,
  $config_dir_purge = true,
  $config_dir_replace = true,
  $source = $console_tools::params::config_source
) inherits console_tools::params {

  case $ensure {
    /(present)/: {
      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }
    }
    /(absent)/: {
      # Leave package installed, as it is a system dependency
      $package_ensure = 'present'
    }
    default: {
      fail('ensure parameter must be present or absent')
    }
  }

  package { $package:
    ensure => $package_ensure,
  }

  file { $config_dir:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    recurse => true,
    replace => $config_dir_replace,
    purge   => $config_dir_purge,
    require => Package[$package],
  }

  file { $config_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    replace => $config_file_replace,
    source  => $source,
    require => File[$config_dir],
  }
}
