#
# == Class: rclocal::config::jessie
#
# Configurations specific to Debian 8.x ("Jessie")
#
class rclocal::config::jessie inherits rclocal::params {

    include ::systemd::params

    file { 'rclocal-rc-local.service':
        ensure  => present,
        name    => "${::systemd::params::unit_dir}/rc-local.service",
        content => template('rclocal/rc-local.service.erb'),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0755',
        notify  => Class['rclocal::service'],
    }
}
