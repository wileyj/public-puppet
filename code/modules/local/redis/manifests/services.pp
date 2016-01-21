class redis::services (
    $services = hiera('redis::services',[]),
){
    service {
        $services:
            enable => true,
            ensure => running,
            path => '/etc/init.d';
        }
}