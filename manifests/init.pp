#
# == Class: rclocal
#
# Setup a simplified startup script system. This allows adding simple startup 
# scripts to applications that have not been packaged for many operating 
# systems. In general, this approach is much more lightweight than creating a 
# startup script for (almost) every distro out there.
#
# == Parameters
#
# None at the moment
#
# == Examples
#
# include rclocal
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-lisence
# See file LICENSE for details
#
class rclocal {

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_rclocal') != 'false' {

    include rclocal::params

    # We need run-parts command to load the fragments
    include runparts

    file { 'rclocal-rc.local.d':
        name => '/etc/rc.local.d',
        ensure => directory,
    }

    # In SuSE /etc/init.d/after.local would be the "natural" place for this 
    # script, but in OpenSuSE 12.1 and later it's not loaded anymore due to 
    # ongoing migration to systemd. Therefore we use /etc/init.d/boot.local, 
    # which runs earlier, but seems to work for now.
    file { 'file-rclocal-rc.local':
        name => $rclocal::params::rclocal_script,
        content => template('rclocal/rc.local.erb'),
        owner => root,
        group => root,
        mode => 755,
    }
}
}
