#
# == Class: rclocal::service
#
# This class enables rc.local on boot
#
class rclocal::service inherits rclocal::params {

    service { 'rclocal':
        name => $::rclocal::params::service_name,
        enable => true,
        provider => $::rclocal::params::service_provider,
        require => Class['rclocal::config'],
    }
}
