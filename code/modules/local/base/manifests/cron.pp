class base::cron(
    $cron = hiera('base::cron', {}),
){
    create_resources(cron::job,$cron)
}