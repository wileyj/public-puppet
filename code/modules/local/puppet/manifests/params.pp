class puppet::params{
    $module_path         = hiera('puppet::common::modulepath',[])
    $env_module_path     = hiera('puppet::env::modulepath',[])
    $packages            = hiera('puppet::packages',[])
    $codedir             = hiera('puppet::common::codedir')
    $confdir             = hiera('puppet::common::confdir')
    $environment         = hiera('puppet::common::environment')
    $factpath            = hiera('puppet::common::fact_path')
    $vardir              = hiera('puppet::common::var_dir')
    $logdir              = hiera('puppet::common::log_dir')
    $puppet_loglevel     = hiera('puppet::common::log_level')
    $rundir              = hiera('puppet::common::run_dir')
    $listen              = hiera('puppet::common::listen')
    $summarize           = hiera('puppet::common::summarize')
    $paramcheck          = hiera('puppet::common::param_check')
    $report              = hiera('puppet::common::report')
    $pluginsync          = hiera('puppet::common::pluginsync')
    $parser              = hiera('puppet::common::pluginsync')
    $env_manifest        = hiera('puppet::env::manifest')
    $env_version         = hiera('puppet::env::version')

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
