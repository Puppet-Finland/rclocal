#
# == Class: rclocal::service
#
# This class enables rc.local on boot
#
class rclocal::service inherits rclocal::params {

    service { 'rclocal':
        name     => $::rclocal::params::service_name,
        # The rclocal service only needs to be enabled on hosts that use systemd
        enable   => $::rclocal::params::service_enable,
        provider => $::rclocal::params::service_provider,
        require  => Class['rclocal::config'],
    }
}
