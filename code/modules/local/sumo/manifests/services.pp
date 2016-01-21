class sumo::services (
    $services       = hiera('sumo::services',[]),
    $service_ensure = hiera('sumo::params::service_ensure'),
    $service_enable = hiera('sumo::params::service_enable'),

) {
    if $service_ensure { validate_string($service_ensure) }
    if $service_enable { validate_bool($service_enable)   }
    service {
        $services:
            ensure  => $service_ensure;
    }
}
