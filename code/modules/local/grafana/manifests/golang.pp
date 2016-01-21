class grafana::golang(
    $modules = hiera('grafana::golang::modules',[]),
){
    package {
        $modules:
            require  => Package["golang"],
            ensure   => latest,
            provider => go;
    }
}