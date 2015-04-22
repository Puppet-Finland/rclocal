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
    include ::rclocal::params

    file { "rclocal-${modulename}":
        ensure  => present,
        name    => "/etc/rc.local.d/${basename}",
        content => template("${modulename}/${basename}.erb"),
        owner   => $::os::params::adminuser,
        group   => $::os::params::admingroup,
        mode    => '0755',
        require => Class['rclocal'],
    }
}
