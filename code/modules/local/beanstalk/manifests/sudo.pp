class beanstalk::sudo(
    $sudo = hiera('beanstalk::sudo', {}),
){
    # create_resources('sudo::conf',$sudo)
}