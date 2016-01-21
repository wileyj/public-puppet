class postgres::packages(
    $packages = hiera('postgres::packages'),
){
    package {
        $packages:
            ensure  => installed;
    } 
}
