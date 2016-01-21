class sensu::params{
    # sensu global settings
    $common_files             = hiera('sensu::common::files', {})
    $sensu_groups             = hiera('sensu::groups',{})
    $log_level                = hiera('sensu::log::level')
    $purge_config             = hiera('sensu::purge::config')
    $sensu_users              = hiera('sensu::users', {})

    # sensu client settings
    $client_subscriptions     = hiera('sensu::client::subscriptions',[])
    $client_critical          = hiera('sensu::client::critical')
    $client_warning           = hiera('sensu::client::warning')
    $client_cron              = hiera('sensu::client::cron',{})
    $client_custom            = hiera('sensu::client::custom')
    $client_packages          = hiera('sensu::client::packages',[])
    $client_refresh           = hiera('sensu::client::refresh')
    $client_services          = hiera('sensu::client::services',[])
    $client_sudo              = hiera('sensu::client::sudo',{})
    $client_files             = hiera('sensu::client::files', {})

    # sensu mail settings
    $mail_from                = hiera('sensu::server::mail_from')
    $mail_to                  = hiera('sensu::server::mail_to')
    $mail_dev                 = hiera('sensu::server::mail_dev')
    $mail_alerts              = hiera('sensu::server::mail_alerts')

    # sensu server settings
    $server_cron              = hiera('sensu::server::cron',{})
    $server_files             = hiera('sensu::server::files', {})
    $server_packages          = hiera('sensu::server::packages',[])
    $server_services          = hiera('sensu::server::services',[])
    $server_sudo              = hiera('sensu::server::sudo',{})
    $api_host                 = hiera('sensu::api::host')
    $api_password             = hiera('sensu::api::password')
    $api_port                 = hiera('sensu::api::port')
    $api_user                 = hiera('sensu::api::user')

    # sensu services settings
    $graphite_host            = hiera('sensu::services::graphite::host')
    $graphite_port            = hiera('sensu::services::graphite::port')
    $rabbitmq_host            = hiera('sensu::services::rabbitmq::host')
    $rabbitmq_password        = hiera('sensu::services::rabbitmq::password')
    $rabbitmq_port            = hiera('sensu::services::rabbitmq::port')
    $rabbitmq_ssl_cert_chain  = hiera('sensu::services::rabbitmq::ssl::cert_chain')
    $rabbitmq_ssl_private_key = hiera('sensu::services::rabbitmq::ssl::private_key')
    $rabbitmq_user            = hiera('sensu::services::rabbitmq::user')
    $rabbitmq_vhost           = hiera('sensu::services::rabbitmq::vhost')
    $redis_host               = hiera('sensu::services::redis::host')
    $redis_port               = hiera('sensu::services::redis::port')

    # host specific config
    $host_files               = hiera('host::files', {})
    $host_sudo                = hiera('host::sudo::conf', {})
    $host_cron                = hiera('host::cron::job', {})
    $host_users               = hiera('host::users', {})
    $host_groups              = hiera('host::groups', {})
    $host_sysctl              = hiera('host::sysctl', {})
    $host_packages            = hiera('host::packages',[])
    $host_python_modules      = hiera('host::python_modules',[])
    $host_nodejs_modules      = hiera('host::nodejs_modules',[])
    $host_golang_modules      = hiera('host::golang_modules',[])
    $host_services            = hiera('host::services',[])
    $host_iptables            = hiera('host::iptables', {})
    $host_keys                = hiera('host::keys',{})
}
