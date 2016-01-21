class sensu::client (
    $rabbitmq_host            = hiera('sensu::services::rabbitmq::host'),
    $rabbitmq_port            = hiera('sensu::services::rabbitmq::port'),
    $rabbitmq_ssl_cert_chain  = hiera('sensu::services::rabbitmq::ssl::cert_chain'),
    $rabbitmq_ssl_private_key = hiera('sensu::services::rabbitmq::ssl::private_key'),
    $rabbitmq_user            = hiera('sensu::services::rabbitmq::user'),
    $rabbitmq_vhost           = hiera('sensu::services::rabbitmq::vhost'),
    $rabbitmq_password        = hiera('sensu::services::rabbitmq::password'),
    $redis_host               = hiera('sensu::services::redis::host'),
    $redis_port               = hiera('sensu::services::redis::port'),
    $client_subscriptions     = hiera('sensu::client::subscriptions',[]),
    $client_critical          = hiera('sensu::client::critical'),
    $client_warning           = hiera('sensu::client::warning'),
    $client_cron              = hiera('sensu::client::cron',{}),
    $client_custom            = hiera('sensu::client::custom'),
    $client_packages          = hiera('sensu::client::packages',[]),
    $client_refresh           = hiera('sensu::client::refresh'),
    $client_services          = hiera('sensu::client::services',[]),
    $client_sudo              = hiera('sensu::client::sudo',{}),
    $client_files             = hiera('sensu::client::files', {}),
){
    include($classes)
    create_resources('file',$client_files)
    create_resources('sudo::conf',$client_sudo)
    create_resources('cron::job',$client_cron)    
    file {
        '/etc/sensu/conf.d/client.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content => template('sensu/configs/client.json.erb'),
            notify  => Service["sensu-client"];

        '/etc/sensu/conf.d/services/api.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content => template('sensu/configs/api.json.erb'),
            notify  => Service["sensu-client"];

        '/etc/sensu/conf.d/services/redis.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content => template('sensu/configs/redis.json.erb'),
            notify  => Service["sensu-client"];

        '/etc/sensu/conf.d/services/rabbitmq.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content => template('sensu/configs/rabbitmq.json.erb'),
            notify  => Service["sensu-client"];

        '/etc/sensu/conf.d/relay.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content => template('sensu/configs/relay.json.erb'),
            notify  => Service["sensu-client"];

        '/etc/sensu/conf.d/handlers/default.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content =>template('sensu/handlers/default.json.erb'),
            notify  => Service["sensu-client"];

        '/etc/sensu/conf.d/handlers/file.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content => template('sensu/handlers/file.json.erb'),
            notify  => Service["sensu-client"];

        '/etc/sensu/conf.d/handlers/graphite.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content => template('sensu/handlers/graphite.json.erb'),
            notify  => Service["sensu-client"];

        '/etc/sensu/conf.d/handlers/graphite_line_tcp.json':
            owner   => 'sensu',
            group   => 'sensu',
            mode    => '0644',
            replace => 'true',
            ensure  => 'present',
            content => template('sensu/handlers/graphite_line_tcp.json.erb'),
            notify  => Service["sensu-client"];

    } ->
    service {
        $client_services:
            enable  => true,
            ensure  => running,
            path    => '/etc/init.d'
    }
}
