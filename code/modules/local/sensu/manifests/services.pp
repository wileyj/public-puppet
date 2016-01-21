class sensu::services(
    $client_services = hiera('sensu::client::services',[]),
    $server_services = hiera('sensu::server::services',[]),
){
    if $server_role == "sensu" {
        service {
            $server_services:
                enable  => true,
                ensure  => running,
                path    => '/etc/init.d'
        }
    }
    service {
        $client_services:
            enable  => true,
            ensure  => running,
            path    => '/etc/init.d'
    }}