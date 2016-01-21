class vpn (
    $files = hiera('vpn::files', {}),
    $cron = hiera('vpn::cron::job', {}),
){
    class { 'vpn::packages': } ->
    class { 'vpn::config': } ->
    class { 'vpn::services': } -> 
    class { 'vpn::configs': } ->
    class { 'vpn::cron': }
}
