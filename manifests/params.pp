#
# == Class: rclocal::params
#
# Defines some variables based on the operating system
#
class rclocal::params {

    case $::osfamily {
        'RedHat': {
            $rclocal_script = '/etc/rc.d/rc.local'
        }
        'Suse': {
            # In SuSE /etc/init.d/after.local would be the "natural" place for 
            # this script, but in OpenSuSE 12.1 and later it's not loaded 
            # anymore due to ongoing migration to systemd. Therefore we use 
            # /etc/init.d/boot.local, which runs earlier, but seems to work for 
            # now.
            $rclocal_script = '/etc/init.d/boot.local'
        }
        'Debian': {
            $rclocal_script = '/etc/rc.local'
        }
        default: {
            $rclocal_script = '/etc/rc.local'
        }
    }
}
