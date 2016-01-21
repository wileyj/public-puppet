class jenkins {
    class { 'jenkins::packages': } ->
    class { 'jenkins::templates': } ->
    class { 'jenkins::sudo': } ->
    class { 'jenkins::cron': } ->
    class { 'jenkins::services': } ->
    class { 'jenkins::sumo': }
}