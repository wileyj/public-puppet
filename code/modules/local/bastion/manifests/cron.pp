class bastion::cron(
    $cron = hiera('bastion::cron', {}),
){
    create_resources(cron::job,$cron)
}