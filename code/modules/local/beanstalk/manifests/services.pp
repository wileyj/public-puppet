class beanstalk::services(
    $services = hiera('beanstalk::services',[]),
){
    service {
        $services:
            enable => true,
            ensure => running,
            path => '/etc/init.d';
    }
}