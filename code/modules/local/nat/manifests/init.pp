class nat {
    class { 'nat::templates': } ->
    class { 'nat::services': } ->
    class { 'nat::firewall': } 
}


