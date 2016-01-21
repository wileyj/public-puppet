class nginx::packages(
    $packages = hiera('nginx::packages',[])                    
){
    package {
        $packages:
            ensure  => installed;
    }
}
