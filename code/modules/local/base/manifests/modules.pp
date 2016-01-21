class base::modules(
    $modules = hiera('common::python::modules',[]),
){
    package {
        $modules:
            require => Package["python27-pip"],
            ensure  => latest,
            provider => pip;
    }
}
