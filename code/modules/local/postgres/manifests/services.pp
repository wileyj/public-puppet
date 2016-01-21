class postgres::services(
    $services = hiera('postgres::services',[]),
){
    service {
        $services:
            ensure => running,
            enable => true,
            path => '/etc/init.d'
    }
}