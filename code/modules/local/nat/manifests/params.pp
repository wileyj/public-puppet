class nat::params{
    $iptables            = hiera('nat::firewall::rules',[])
    $files               = hiera('nat::files', [])
    $services            = hiera('nat::services',[])

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
