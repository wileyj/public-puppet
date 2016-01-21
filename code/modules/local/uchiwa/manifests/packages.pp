class uchiwa::packages (
    $packages = hiera('uchiwa::packages',[]),
){
    package {
        $packages:
            ensure  => latest;
    }
}