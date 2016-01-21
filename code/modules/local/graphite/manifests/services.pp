class graphite::services(
    $services = hiera('graphite::services',[])
){
    service {
        $services:
            enable => true,
            ensure => running,
            path => '/etc/init.d';
    }
}