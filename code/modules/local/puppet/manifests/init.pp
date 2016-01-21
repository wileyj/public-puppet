class puppet {
    class { 'puppet::packages': } ->
    class { 'puppet::templates': } ->
    class { 'puppet::sumo': }
}
