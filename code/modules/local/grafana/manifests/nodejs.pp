class grafana::nodejs(
    $modules = hiera('grafana::nodejs::modules',[]),
){
    package {
        $modules:
            require  => Package["nodejs-npm"],
            #ensure  => latest,
            provider => npm;
    }
}