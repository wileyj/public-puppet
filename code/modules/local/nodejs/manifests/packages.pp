class nodejs::packages(
    $packages = hiera('nodejs::packages',[]),
) {
    package {
        $packages:
            ensure  => latest;
    }
}
