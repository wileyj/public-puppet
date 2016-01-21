class vpn::services (
    $services = hiera('vpn::services',''),
){
    service {
        $services:
            ensure => running,
            enable => true,
            path => '/etc/init.d'
    }
}
