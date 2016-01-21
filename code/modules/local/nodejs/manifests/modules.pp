class nodejs::modules(
    $modules = hiera('nodejs::modules',[]),
){
    package {
        $modules:
            require => Package["nodejs-npm"],
            #ensure  => latest,
            provider => npm;
    }
}
