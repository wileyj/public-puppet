class subversion::packages(
    $packages = hiera('subversion::packages',[]),
){
    package {
        $packages:
            install_options => ['--disableexcludes=local_x86_64'],
            ensure  => latest;
    }
}