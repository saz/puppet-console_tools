# puppet-console_tools

Manage console tools settings via Puppet

## Usage

```
    class { 'console_tools': }
```

## Other class parameters
* ensure: present or absent, default: present
* autoupgrade: true or false, default: false. Auto-upgrade package, if there is a newer version.
* package: string, default: OS specific. Set package name, if platform is not supported.
* config_file: string, default: OS specific. Set config_file, if platform is not supported.
* config_file_replace: true or false, default: true.  Replace config file with defined config file.
* config_dir: string, default: OS specific. Set config_dir, if platform is not supported.
* config_dir_purge: true or false, default: true. Remove files in config_dir, if they are not managed by puppet-console_tools
* config_dir_replace: true or false, default: true. Replace config files in config_dir.
* source: string, default OS specific. Set source, if platform is not supported.
