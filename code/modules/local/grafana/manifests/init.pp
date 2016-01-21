class grafana {
    include($classes)
    exec {
        'grafana createdb':
            command     => '/usr/pgsql-9.4/bin/psql template1 -U postgres -f /root/grafana.sql; touch /root/.grafanadb',
            require     => File['/root/grafana.sql'],
            creates     => "/root/.grafanadb";
    } ->
    class { 'nodejs': } ->
    class { 'grafana::packages':  } ->
    class { 'grafana::golang':    } ->
    class { 'grafana::nodejs':    } ->
    class { 'grafana::exec':      } ->
    class { 'grafana::files':     } ->
    class { 'grafana::templates': } ->
    class { 'grafana::services':  } ->
    class { 'grafana::sumo': }
}
