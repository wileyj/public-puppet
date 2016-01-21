class nginx::params{
    $files               = hiera('nginx::files', {})
    $sudo                = hiera('nginx::sudo::conf', {})
    $cron                = hiera('nginx::cron::job', {})
    $sysctl              = hiera('nginx::sysctl', {})
    $packages            = hiera('nginx::packages',[])
    $services            = hiera('nginx::services',[])
    $users               = hiera('nginx::users',[])
    $groups              = hiera('nginx::groups',[])

    # host specific nginx configs
    # move to site.yaml at some point, rather than on the host itself
    $nginx_configs       = hiera('nginx::configs', {})

    # host specific config
    $host_files          = hiera('host::files', {})
    $host_sudo           = hiera('host::sudo::conf', {})
    $host_cron           = hiera('host::cron::job', {})
    $host_users          = hiera('host::users', {})
    $host_groups         = hiera('host::groups', {})
    $host_sysctl         = hiera('host::sysctl', {})
    $host_packages       = hiera('host::packages',[])
    $host_python_modules = hiera('host::python_modules',[])
    $host_nodejs_modules = hiera('host::nodejs_modules',[])
    $host_golang_modules = hiera('host::golang_modules',[])
    $host_services       = hiera('host::services',[])
    $host_iptables       = hiera('host::iptables', {})
    $host_keys           = hiera('host::keys',{})
}
