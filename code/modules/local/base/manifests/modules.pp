class base::modules(
    $modules = hiera('common::python::modules',[]),
    $python  = hiera('python::env::name'),
){
    package {
        $modules:
            require => Package["${python}-pip"],
            ensure  => latest,
            provider => pip;
    }
}
