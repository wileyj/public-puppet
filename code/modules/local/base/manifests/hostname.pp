class base::hostname{
    if $::hostname_full{
        augeas { 
            'sysconfig/network hostname':
                changes => "set /files/etc/sysconfig/network/HOSTNAME ${::hostname_full}",
        } ->
        host { 
            'custom fqdn':
                ensure  => present,
                name    => $::hostname_full,
                ip      => $::ipaddress,
        } ->
        exec { 
            'set system hostname':
                command => "/bin/hostname ${::hostname_full}",
                unless  => "/usr/bin/test `/bin/hostname` = '${::hostname_full}'",
        }
    }
}