class graphite::packages(
    $packages = hiera('graphite::packages',[]),
){
    package {
        "postgresql-libs":
            ensure => absent;
        $packages:
            ensure  => installed;
    }
}