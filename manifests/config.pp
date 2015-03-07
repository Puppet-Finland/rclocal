#
# == Class: rclocal::config
#
# Configure rc.local
#
class rclocal::config inherits rclocal::params {

    file { 'rclocal-rc.local.d':
        name => '/etc/rc.local.d',
        ensure => directory,
    }

    file { 'file-rclocal-rc.local':
        name => $::rclocal::params::rclocal_script,
        content => template('rclocal/rc.local.erb'),
        owner => root,
        group => root,
        mode => 755,
    }

    if $::lsbdistcodename == 'jessie' {
        include rclocal::config::jessie
    }
}
