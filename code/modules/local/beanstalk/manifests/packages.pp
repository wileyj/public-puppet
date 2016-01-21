class beanstalk::packages(
    $packages = hiera('beanstalk::packages',[]),
){
    package {
        $packages:
            ensure  => latest;
    }
}