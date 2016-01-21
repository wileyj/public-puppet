class sensu::templates(
    $files                    = hiera('sensu::common::files', {}),
    $server_files             = hiera('sensu::server::files', {}),
    $client_files             = hiera('sensu::client::files', {}),
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
    $client_refresh           = hiera('sensu::client::refresh'),
    $api_host                 = hiera('sensu::api::host'),
    $api_password             = hiera('sensu::api::password'),
    $api_port                 = hiera('sensu::api::port'),
    $api_user                 = hiera('sensu::api::user'),
    $mail_from                = hiera('sensu::server::mail_from'),
    $mail_to                  = hiera('sensu::server::mail_to'),
    $mail_dev                 = hiera('sensu::server::mail_dev'),
    $mail_alerts              = hiera('sensu::server::mail_alerts'),
){
    create_resources('file',$files)
    if $server_role == "sensu" {
        create_resources('file',$server_files)  
        file {
            '/etc/sensu/config.json':
                owner   => 'sensu',
                group   => 'sensu',
                mode    => '0644',
                replace => 'true',
                ensure  => 'present',
                content => template('sensu/configs/config.json.erb'),
                notify  => Service["sensu-server", "sensu-api"];

            '/etc/sensu/conf.d/communication/mailer.json':
                owner   => 'sensu',
                group   => 'sensu',
                mode    => '0644',
                replace => 'true',
                ensure  => 'present',
                content => template('sensu/communication/mailer.json.erb'),
                notify  => Service["sensu-server", "sensu-api"];
        }
    }
    create_resources('file',$client_files)
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
    }
}