class redis { 
    # if $server_class == "cluster" {
    #     class { 'redis::lvm': }
    # } 
    class { 'redis::packages': } 
    if $server_class != "cluster" {
        class { 'redis::config': }
    } 
    Class['redis'] ->
    class { 'redis::templates': } ->
    class { 'redis::services': } ->
    class { 'redis::sumo': } 
}