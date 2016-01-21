class uchiwa::cron(
    $cron  = hiera('uchiwa::cron::job', {}),
) {
    create_resources('cron::job',$cron)
}