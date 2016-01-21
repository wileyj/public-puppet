class redis::packages ( 
    $version  = 'latest',
    $packages = hiera('redis::packages',[]),
){
    package {
        $packages:
            ensure => $version,
            provider => "yum";
    }
}