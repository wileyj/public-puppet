class jenkins::packages(
    $packages = hiera('jenkins::packages',[]) ,                   
){
    package {
        $packages:
            ensure  => latest;
    }
}