class sensu::cron(
    $server_cron  = hiera('sensu::server::cron',{}),
    $client_cron  = hiera('sensu::client::cron',{}),
){
    if $server_role == "sensu" {
        notify{" INIT Sensu Server cron " : }
        create_resources('cron::job',$server_cron)
    }
    create_resources('cron::job',$client_cron)
}