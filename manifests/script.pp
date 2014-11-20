#
# == Define: rclocal::script
#
# A convenience wrapper for installing rclocal scripts from other Puppet 
# modules.
# 
# == Parameters
#
# [*modulename*]
#   Name of the rclocal script. For simplicity, this define will look for a 
#   template ${modulename}/${modulename}.erb, and place it in 
#   /etc/rc.local.d/${modulename}.
# [*basename*]
#   Basename of the rc.local.d template file. Defaults to $modulename.
#
# == Examples
#
#   rclocal::script { 'buildbot-rc.local-script':
#       modulename => 'buildbot',
#   }
#
# == Authors
#
# Samuli Seppänen <samuli.seppanen@gmail.com>
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
define rclocal::script
(
    $modulename,
    $basename=$modulename
)
{
    file { "rclocal-${modulename}":
        name => "/etc/rc.local.d/${basename}",
        content => template("${modulename}/${basename}.erb"),
        ensure => present,
        owner => root,
        group => root,
        mode => 755,
        require => Class['rclocal'],
    }
}
