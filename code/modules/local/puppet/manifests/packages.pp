class puppet::packages(
    $packages = hiera('puppet::packages',[]),        
){
    package {
        $packages:
            ensure  => latest;
    }
}
