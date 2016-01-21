class nginx {
    class { 'nginx::users': } ->
    class { 'nginx::packages': } ->
    class { 'nginx::templates': } ->
    class { 'nginx::sudo': } ->
    class { 'nginx::cron': } ->
    class { 'nginx::sysctl': } ->
    class { 'nginx::services': } ->
    class { 'nginx::sumo': }
}


