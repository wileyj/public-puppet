class sensu {
    class { 'sensu::users' : } ->
    class { 'sensu::packages' : } ->
    #class { 'sensu::client' : } ->
    class { 'sensu::templates' : } ->
    class { 'sensu::services' : } -> 
    class { 'sensu::cron' : } ->
    class { 'sensu::sudo' : } ->
    class { 'sensu::sumo' : }
}