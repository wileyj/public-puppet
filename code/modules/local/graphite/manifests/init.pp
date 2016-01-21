class graphite inherits graphite::params {
    exec {
        'graphite createdb':
            command     => '/usr/pgsql-9.4/bin/psql template1 -U postgres -f /root/graphite.sql; /bin/touch /root/.graphitedb',
            require     => File['/root/graphite.sql'],
            creates     => "/root/.graphitedb";
    } ->
    class { 'lvm': } ->
    class { 'graphite::users': } ->
    class { 'graphite::packages': } ->
    class { 'graphite::modules': } ->
    class { 'graphite::files': } ->
    class { 'graphite::templates': } ->
    class { 'graphite::services': } ->
    class { 'graphite::sumo': }
}
