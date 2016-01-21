class nginx::services(
    $services = hiera('nginx::services',[]),
){
    service {
        $services:
            enable => true,
            ensure => running,
            path => '/etc/init.d'
    }
}
