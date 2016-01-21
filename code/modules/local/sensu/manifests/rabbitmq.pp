class sensu::rabbitmq (
    $password       = hiera('sensu::services::rabbitmq::password'),
    $rabbitmq_vhost = hiera('sensu::services::rabbitmq::vhost'),
){
    include($classes)
    rabbitmq_user { 
        'sensu':
            admin    => true,
            password => $password,
            tags     => ['monitoring', 'sensu'];
    }  -> 
    rabbitmq_user { 
        'admin':
            admin    => true,
            password => 'admin';
    }  -> 
    rabbitmq_vhost { 
        '/sensu':
            ensure => present,
    } ->
    rabbitmq_user_permissions { 
        'sensu@/sensu':
            configure_permission => '.*',
            read_permission      => '.*',
            write_permission     => '.*',
    } 
}
