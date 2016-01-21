class nat::services(
    $services = hiera('nat::services',[]),                
){
    service {
        $services:
            ensure => running,
            enable => true,
            path => '/etc/init.d'
    }
}
