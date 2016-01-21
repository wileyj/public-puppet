class nodejs::services(
    $services = hiera('nodejs::services',[]),
){
    service {
        $services:
            ensure => running,
            enable => true,
            path => '/etc/init.d'
    }
}