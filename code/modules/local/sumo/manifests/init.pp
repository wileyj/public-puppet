class sumo {
    class { 'sumo::templates': } ->
    class { 'sumo::install': } ->
    class { 'sumo::services': } 
    contain sumo::install
    contain sumo::templates
    contain sumo::services
}
