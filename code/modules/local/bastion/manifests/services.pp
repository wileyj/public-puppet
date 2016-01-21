class bastion::services (
    $services_off = hiera('bastion::services::off',[]),
    $services_on  = hiera('bastion::services::on',[]),
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