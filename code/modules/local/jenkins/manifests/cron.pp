class jenkins::cron(
    $cron = hiera('jenkins::cron', {}),
){
    create_resources('cron::job',$cron)
}