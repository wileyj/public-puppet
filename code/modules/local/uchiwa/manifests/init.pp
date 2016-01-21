class uchiwa (
    $classes = hiera('uchiwa::classes', []),
){
    include($classes)
    class { 'uchiwa::users': } ->
    class { 'uchiwa::packages': } ->
    class { 'uchiwa::modules': } ->
    class { 'uchiwa::templates': } ->
    class { 'uchiwa::services': } ->
    class { 'uchiwa::sumo': } ->
    class { 'uchiwa::cron': }
}