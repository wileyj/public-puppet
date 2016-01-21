class vpn::packages(
    $packages = hiera('vpn::packages',[]),
) {
    package {
        $packages:
            ensure  => installed;
    }
}
