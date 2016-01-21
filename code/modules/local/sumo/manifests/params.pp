class sumo::params {
    $access_id           = hiera('sumo::access::id')
    $access_key          = hiera('sumo::access::key')
    $sync_sources        = hiera('sumo::sync::sources')
    $config_clobber      = undef #hiera('sumo::config::clobber')
    $collector_name      = $::hostname
    $config_dir          = hiera('sumo::config::dir')
    $config_file         = hiera('sumo::config::file')
    $config_template     = 'sumo/sumo.conf.erb'
    $config_email        = undef #hiera('sumo::config::email')
    $config_ephemeral    = hiera('sumo::config::ephemeral')
    $install_dir         = hiera('sumo::install::dir')
    $install_script      = hiera('sumo::install::script')
    $install_script_dir  = '/tmp'
    $config_override     = undef #hiera('sumo::config::override')
    $config_password     = undef #hiera('sumo::config::password')
    $proxy_host          = undef #hiera('sumo::proxy::host')
    $proxy_ntlm_domain   = undef #hiera('sumo::proxy::ntlm_domain')
    $proxy_password      = undef #hiera('sumo::proxy::password')
    $proxy_port          = undef #hiera('sumo::proxy::port')
    $service_ensure      = 'running'
    $service_enable      = true
    $sources_file        = undef #hiera('sumo::sources::file')
    $sources_template    = 'sumo/sumo.json.erb'
    $packages            = hiera('sumo::packages',[])
    $download_url        = hiera('sumo::download::url')
    $get_installer_cmd   = "/usr/bin/curl -o ${install_script} ${download_url}"

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