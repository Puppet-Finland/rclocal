#
# == Class: rclocal::params
#
# Defines some variables based on the operating system
#
class rclocal::params {

    include os::params

    case $::osfamily {
        'RedHat': {
            $rclocal_script = '/etc/rc.d/rc.local'
            $legacy_service_name = 'rc.local'
        }
        'Debian': {
            $rclocal_script = '/etc/rc.local'
            $legacy_service_name = 'rc.local'
        }
        default: {
            fail("Unsupported operating system ${::operatingsystem}")
        }
    }

    if $::has_systemd == 'true' {
        $service_name = 'rc-local'
        $service_provider = 'systemd'
        $service_enable = true
    } else {
        $service_name = $legacy_service_name
        $service_provider = undef
        $service_enable = undef
    }
}
