class postgres {
    include($classes)
    class { 'postgres::users': } ->
    class { 'postgres::packages': } ->
    class { 'postgres::initdb': } ->
    class { 'postgres::templates': } ->
    class { 'postgres::firewall': } ->
    class { 'postgres::services': } ->
    #class { 'postgres::sumo': }
}
