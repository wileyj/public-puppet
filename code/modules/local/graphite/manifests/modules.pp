class graphite::modules(
    $modules = hiera('graphite::modules',[]),
    $python  = hiera('python::env::name'),
){
    package {
        $modules:
            require => Package["${python}-pip"],
            ensure  => latest,
            provider => pip;
    }
}