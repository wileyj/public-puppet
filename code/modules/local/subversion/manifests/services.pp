class subversion::services(
    $services = hiera('subversion::services',[]),
){
    service {
        $services:
            ensure => running,
            enable => true,
            path => '/etc/init.d'
    }
}