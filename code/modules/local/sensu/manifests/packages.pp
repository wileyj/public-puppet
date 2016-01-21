class sensu::packages (
    $client_packages = hiera('sensu::client::packages',[]),
    $server_packages = hiera('sensu::server::packages',[]),
){
    if $server_role == "sensu" {
        notify{ " INIT Sensu Server Packages " : }
        notify{ " INIT Sensu Rabbitmq " : }
        class { 'sensu::rabbitmq' : } ->
        package {
            $server_packages:
                ensure  => 'latest';
        }
    }
    package {
        $client_packages:
            ensure  => 'latest';
    }
}