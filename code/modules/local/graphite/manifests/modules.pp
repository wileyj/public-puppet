class graphite::modules(
    $modules = hiera('graphite::modules',[]),
){
    package {
        $modules:
            require => Package["python27-pip"],
            ensure  => latest,
            provider => pip;
    }
}