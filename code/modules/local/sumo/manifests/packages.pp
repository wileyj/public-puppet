class sumo::packages (
    $packages = hiera('sumo::packages',[]),
) {
    package {
        $packages:
            ensure  => latest;
    }
}
