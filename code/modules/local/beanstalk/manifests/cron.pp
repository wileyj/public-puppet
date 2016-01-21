class beanstalk::cron(
    $cron = hiera('beanstalk::cron', {}),
){
    # create_resources('cron::job',$cron)
}