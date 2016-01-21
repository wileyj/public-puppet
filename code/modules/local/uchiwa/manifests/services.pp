class uchiwa::services (
    $services = hiera('uchiwa::services',[]),
){
    service {
        $services:
            enable => true,
            ensure => running,
            path => '/etc/init.d';
    }
}