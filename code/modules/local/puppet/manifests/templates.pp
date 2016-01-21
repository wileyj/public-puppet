class puppet::templates (
    $module_path         = hiera('puppet::common::modulepath',[]),
    $env_module_path     = hiera('puppet::env::modulepath',[]),
    $codedir             = hiera('puppet::common::codedir'),
    $confdir             = hiera('puppet::common::confdir'),
    $environment         = hiera('puppet::common::environment'),
    $factpath            = hiera('puppet::common::fact_path'),
    $vardir              = hiera('puppet::common::var_dir'),
    $logdir              = hiera('puppet::common::log_dir'),
    $puppet_loglevel     = hiera('puppet::common::log_level'),
    $rundir              = hiera('puppet::common::run_dir'),
    $listen              = hiera('puppet::common::listen'),
    $summarize           = hiera('puppet::common::summarize'),
    $paramcheck          = hiera('puppet::common::param_check'),
    $report              = hiera('puppet::common::report'),
    $pluginsync          = hiera('puppet::common::pluginsync'),
    $parser              = hiera('puppet::common::pluginsync'),
    $env_manifest        = hiera('puppet::env::manifest'),
    $env_version         = hiera('puppet::env::version'),
){
    file {
        '/etc/puppetlabs/puppet/puppet.conf':
            ensure  => file,
            replace => true,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => template('puppet/puppet.conf.erb');

        "/etc/puppetlabs/code/environments/$tag_environment/environment.conf":
            ensure  => file,
            replace => true,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => template('puppet/environment.conf.erb');

    }
}
