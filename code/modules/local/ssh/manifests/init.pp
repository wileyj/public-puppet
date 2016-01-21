class ssh (
    $root_allowed     = hiera('ssh::config::root_allowed'),
    $password_allowed = hiera('ssh::config::password_allowed'),
){
    if $server_role != "bastion" {
        class { 'ssh::packages' : } ->
        class { 'ssh::templates' : } ->
        class { 'ssh::services' : }->
        class { 'ssh::sumo' : }
    }
}
