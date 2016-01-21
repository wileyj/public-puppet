class sensu::sudo(
    $server_sudo  = hiera('sensu::server::sudo',{}),
    $client_sudo  = hiera('sensu::client::sudo',{}),
){
    if $server_role == "sensu" {
        notify{" INIT Sensu Server sudo " : }
        create_resources('sudo::conf',$server_sudo)
    }
    create_resources('sudo::conf',$client_sudo)
}