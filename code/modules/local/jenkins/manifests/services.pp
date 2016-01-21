class jenkins::services(
    $services = hiera('jenkins::services',[]),
){
    service {
        $services:
            ensure => running,
            enable => true,
            path => '/etc/init.d'
    }
}