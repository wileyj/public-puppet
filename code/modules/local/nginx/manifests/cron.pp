class nginx::cron(
    $cron = hiera('nginx::cron', {}),
){
    create_resources('cron::job',$cron)
}
