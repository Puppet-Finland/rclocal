#
# == Class: rclocal::config
#
# Configure rc.local
#
class rclocal::config inherits rclocal::params {

    file { 'rclocal-rc.local.d':
        ensure => directory,
        name   => '/etc/rc.local.d',
    }

    file { 'file-rclocal-rc.local':
        ensure  => present,
        name    => $::rclocal::params::rclocal_script,
        content => template('rclocal/rc.local.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0755',
    }

    if $::lsbdistcodename == 'jessie' {
        include ::rclocal::config::jessie
    }
}
