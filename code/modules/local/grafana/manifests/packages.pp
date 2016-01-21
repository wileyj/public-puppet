class grafana::packages(
    $packages = hiera('grafana::packages',[])
){
    package {
        $packages:
            ensure  => installed;
    }
}