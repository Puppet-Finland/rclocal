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
# [*manage*]
#   Manage rc.local using this module. Valid values 'yes' (default) and 'no'.
#
# == Examples
#
#   include rclocal
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
class rclocal
(
    $manage = 'yes'
)
{

if $manage == 'yes' {
    # We need run-parts command to load the fragments
    include ::runparts
    include ::rclocal::config
    include ::rclocal::service
}
}
