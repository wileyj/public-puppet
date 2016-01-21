class ssh::packages (
    $packages = hiera('ssh::packages',[]),
){
    package {
        $packages:
            ensure => 'latest';
    }
}
