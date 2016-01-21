class java::packages (
    $packages = hiera('java::packages', [])
){
    package {
        $packages:
            ensure  => installed;
    }
}
