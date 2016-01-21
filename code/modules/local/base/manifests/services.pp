class base::services (
    $services_off = hiera('common::services::off',[]),
    $services_on  = hiera('common::services::on',[]),
){
    service {
        $services_off:
            enable => false,
            ensure => stopped,
            path => '/etc/init.d';
    } ->
    service {
        $services_on:
            enable => true,
            ensure => running,
            path => '/etc/init.d';
    }
}