class graphite::templates(
    $files                                        = hiera('graphite::files', {}),
    $carbon_cache_storage_dir                     = hiera('graphite::cache_storage_dir'),
    $carbon_cache_local_data_dir                  = hiera('graphite::cache_local_data_dir'),
    $carbon_cache_whitelists_dir                  = hiera('graphite::cache_whitelists_dir'),
    $carbon_cache_conf_dir                        = hiera('graphite::cache_conf_dir'),
    $carbon_cache_log_dir                         = hiera('graphite::cache_log_dir'),
    $carbon_cache_pid_dir                         = hiera('graphite::cache_pid_dir'),
    $carbon_cache_user                            = hiera('graphite::cache_user'),
    $carbon_cache_max_cache_size                  = hiera('graphite::cache_max_cache_size'),
    $carbon_cache_max_updates_per_second          = hiera('graphite::cache_max_updates_per_second'),
    $carbon_cache_max_creates_per_minute          = hiera('graphite::cache_max_creates_per_minute'),
    $carbon_cache_line_receiver_interface         = hiera('graphite::cache_line_receiver_interface'),
    $carbon_cache_line_receiver_port              = hiera('graphite::cache_line_receiver_port'),
    $carbon_cache_enable_udp_listener             = hiera('graphite::cache_enable_udp_listener'),
    $carbon_cache_udp_receiver_interface          = hiera('graphite::cache_udp_receiver_interface'),
    $carbon_cache_udp_receiver_port               = hiera('graphite::cache_udp_receiver_port'),
    $carbon_cache_pickle_receiver_interface       = hiera('graphite::cache_pickle_receiver_interface'),
    $carbon_cache_pickle_receiver_port            = hiera('graphite::cache_pickle_receiver_port'),
    $carbon_cache_use_insecure_unpickler          = hiera('graphite::cache_use_insecure_unpickler'),
    $carbon_cache_cache_query_interface           = hiera('graphite::cache_cache_query_interface'),
    $carbon_cache_cache_query_port                = hiera('graphite::cache_cache_query_port'),
    $carbon_cache_use_flow_control                = hiera('graphite::cache_use_flow_control'),
    $carbon_cache_log_updates                     = hiera('graphite::cache_log_updates'),
    $carbon_cache_whisper_autoflush               = hiera('graphite::cache_whisper_autoflush'),
    $carbon_cache_amqp_verbose                    = hiera('graphite::cache_amqp_verbose'),
    $carbon_cache_amqp_host                       = hiera('sensu::services::rabbitmq::host'),
    $carbon_cache_amqp_port                       = hiera('sensu::services::rabbitmq::port'),
    $carbon_cache_amqp_vhost                      = hiera('graphite::cache_amqp_vhost'),
    $carbon_cache_amqp_user                       = hiera('sensu::services::rabbitmq::user'),
    $carbon_cache_amqp_password                   = hiera('sensu::services::rabbitmq::password'),
    $carbon_cache_amqp_exchange                   = hiera('graphite::cache_amqp_exchange'),
    $carbon_cache_amqp_metric_name_in_body        = hiera('graphite::cache_amqp_metric_name_in_body'),
    $carbon_relay_line_receiver_interface         = hiera('graphite::relay_line_receiver_interface'),
    $carbon_relay_line_receiver_port              = hiera('graphite::relay_line_receiver_port'),
    $carbon_relay_pickle_receiver_interface       = hiera('graphite::relay_pickle_receiver_interface'),
    $carbon_relay_pickle_receiver_port            = hiera('graphite::relay_pickle_receiver_port'),
    $carbon_relay_relay_method                    = hiera('graphite::relay_relay_method'),
    $carbon_relay_replication_factor              = hiera('graphite::relay_replication_factor'),
    $carbon_relay_destinations                    = hiera('graphite::relay_destinations'),
    $carbon_aggregator_line_receiver_interface    = hiera('graphite::aggregator_line_receiver_interface'),
    $carbon_aggregator_line_receiver_port         = hiera('graphite::aggregator_line_receiver_port'),
    $carbon_aggregator_pickle_receiver_interface  = hiera('graphite::aggregator_pickle_receiver_interface'),
    $carbon_aggregator_pickle_receiver_port       = hiera('graphite::aggregator_pickle_receiver_port'),
    $carbon_aggregator_destinations               = hiera('graphite::aggregator_destinations'),
    $carbon_aggregator_replication_factor         = hiera('graphite::aggregator_replication_factor'),
    $carbon_aggregator_max_queue_size             = hiera('graphite::aggregator_max_queue_size'),
    $carbon_aggregator_use_flow_control           = hiera('graphite::aggregator_use_flow_control'),
    $carbon_aggregator_max_datapoints_per_message = hiera('graphite::aggregator_max_datapoints_per_message'),
    $carbon_aggregator_max_aggregation_intervals  = hiera('graphite::aggregator_max_aggregation_intervals'),
    $storage_schema_pattern                       = hiera('graphite::carbon_pattern'),
    $storage_schema_retentions                    = hiera('graphite::carbon_retentions'),
    $dashboard_ui_default_graph_width             = hiera('graphite::ui_default_graph_width'),
    $dashboard_ui_default_graph_height            = hiera('graphite::ui_default_graph_height'),
    $dashboard_ui_automatic_variants              = hiera('graphite::ui_automatic_variants'),
    $dashboard_ui_refresh_interval                = hiera('graphite::ui_refresh_interval'),
    $dashboard_ui_autocomplete_delay              = hiera('graphite::ui_autocomplete_delay'),
    $dashboard_ui_merge_hover_delay               = hiera('graphite::ui_merge_hover_delay'),
    $dashboard_ui_theme                           = hiera('graphite::ui_theme'),
    $dashboard_keyboard_toggle_toolbar            = hiera('graphite::keyboard_toggle_toolbar'),
    $dashboard_keyboard_toggle_metrics_panel      = hiera('graphite::keyboard_toggle_metrics_panel'),
    $dashboard_keyboard_erase_all_graphs          = hiera('graphite::keyboard_erase_all_graphs'),
    $dashboard_keyboard_save_dashboard            = hiera('graphite::keyboard_save_dashboard'),
    $dashboard_keyboard_completer_add_metrics     = hiera('graphite::keyboard_completer_add_metrics'),
    $dashboard_keyboard_completer_del_metrics     = hiera('graphite::keyboard_completer_del_metrics'),
    $dashboard_keyboard_give_completer_focus      = hiera('graphite::keyboard_give_completer_focus'),
    $local_time_zone                              = hiera('graphite::local_time_zone'),
    $local_documentation_url                      = hiera('graphite::local_documentation_url'),
    $local_log_rendering_performance              = hiera('graphite::local_log_rendering_performance'),
    $local_log_cache_performance                  = hiera('graphite::local_log_cache_performance'),
    $local_log_metric_access                      = hiera('graphite::local_log_metric_access'),
    $local_debug                                  = hiera('graphite::local_debug'),
    $local_flushrrdcached                         = hiera('graphite::local_flushrrdcached'),
    $local_local_memcache_hosts                   = hiera('graphite::local_memcache_hosts',[]),
    $local_default_cache_duration                 = hiera('graphite::local_default_cache_duration'),
    $local_secret_key                             = hiera('graphite::local_secret_key'),
    $local_graphite_root                          = hiera('graphite::local_graphite_root'),
    $local_conf_dir                               = hiera('graphite::local_conf_dir'),
    $local_storage_dir                            = hiera('graphite::local_storage_dir'),
    $local_content_dir                            = hiera('graphite::local_content_dir'),
    $local_dashboard_conf                         = hiera('graphite::local_dashboard_conf'),
    $local_graphtemplates_conf                    = hiera('graphite::local_graphtemplates_conf'),
    $local_whisper_dir                            = hiera('graphite::local_whisper_dir'),
    $local_local_rrd_dir                          = hiera('graphite::local_rrd_dir'),
    $local_local_data_dirs                        = hiera('graphite::local_data_dirs',[]),
    $local_local_log_dir                          = hiera('graphite::local_log_dir'),
    $local_index_file                             = hiera('graphite::local_index_file'),
    $local_email_backend                          = hiera('graphite::local_email_backend'),
    $local_email_host                             = hiera('graphite::local_email_host'),
    $local_email_port                             = hiera('graphite::local_email_port'),
    $local_email_host_user                        = hiera('graphite::local_email_host_user'),
    $local_email_host_password                    = hiera('graphite::local_email_host_password'),
    $local_email_use_tls                          = hiera('graphite::local_email_use_tls'),
    $local_use_remote_user_authentication         = hiera('graphite::local_use_remote_user_authentication'),
    $local_login_url                              = hiera('graphite::local_login_url'),
    $local_database_engine                        = hiera('graphite::local_database_engine'),
    $local_database_name                          = hiera('graphite::local_database_name'),
    $local_database_user                          = hiera('graphite::local_database_user'),
    $local_database_password                      = hiera('graphite::local_database_password'),
    $local_database_host                          = hiera('sensu::services::graphite::host'),
    $local_database_port                          = hiera('graphite::local_database_port'),
    $local_cluster_servers                        = hiera('graphite::local_cluster_servers',[]),
    $local_remote_store_fopth_timeout             = hiera('graphite::local_remote_store_fopth_timeout'),
    $local_remote_store_find_timeout              = hiera('graphite::local_remote_store_find_timeout'),
    $local_remote_store_retry_delay               = hiera('graphite::local_remote_store_retry_delay'),
    $local_remote_find_cache_duration             = hiera('graphite::local_remote_find_cache_duration'),
    $local_remote_rendering                       = hiera('graphite::local_remote_rendering'),
    $local_rendering_hosts                        = hiera('graphite::local_rendering_hosts'),
    $local_remote_render_connect_timeout          = hiera('graphite::local_remote_render_connect_timeout'),
    $local_carbonlink_hosts                       = hiera('graphite::local_carbonlink_hosts',[]),
    $local_carbonlink_timeout                     = hiera('graphite::local_carbonlink_timeout'),
    $uwsgi_binary_path                            = hiera('graphite::uwsgi_binary_path'),
    $uwsgi_processes                              = hiera('graphite::uwsgi_processes'),
    $uwsgi_socket                                 = hiera('graphite::uwsgi_socket'),
    $uwsgi_wsgi_file                              = hiera('graphite::uwsgi_wsgi_file'),
    $uwsgi_gid                                    = hiera('graphite::uwsgi_gid'),
    $uwsgi_uid                                    = hiera('graphite::uwsgi_uid'),
    $uwsgi_module                                 = hiera('graphite::uwsgi_module'),
    $uwsgi_daemonize                              = hiera('graphite::uwsgi_daemonize'),
    $uwsgi_chown_socket                           = hiera('graphite::uwsgi_chown_socket'),
    $uwsgi_die_on_term                            = hiera('graphite::uwsgi_die_on_term'),
    $uwsgi_emperor                                = hiera('graphite::uwsgi_emperor'),
    $uwsgi_enable_threads                         = hiera('graphite::uwsgi_enable_threads'),
    $uwsgi_limit_as                               = hiera('graphite::uwsgi_limit_as'),
    $uwsgi_master                                 = hiera('graphite::uwsgi_master'),
    $uwsgi_vacuum                                 = hiera('graphite::uwsgi_vacuum'),
    $uwsgi_vhost                                  = hiera('graphite::uwsgi_vhost'),
    $uwsgi_workers                                = hiera('graphite::uwsgi_workers'),
){
    create_resources('file',$files)
    file { 
        '/usr/local/lib/python2.7/site-packages/cairocffi/__init__.py':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'puppet:///modules/base/usr/local/lib/python2.7/site-packages/cairocffi/__init__.py',
            require => Package["cairocffi"];

        '/etc/default/graphite-carbon':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'puppet:///modules/base/etc/default/graphite-carbon',
            notify  => Service["graphite"];

        '/opt/graphite/conf/relay-rules.conf':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/relay-rules.conf.example',
            notify  => Service["graphite"];

        '/opt/graphite/conf/aggregation-rules.conf':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/aggregation-rules.conf.example',
            notify  => Service["graphite"];

        '/opt/graphite/conf/blacklist.conf':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/blacklist.conf.example',
            notify  => Service["graphite"];

        '/opt/graphite/conf/whitelist.conf':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/blacklist.conf.example',
            notify  => Service["graphite"];

        '/opt/graphite/conf/carbon.amqp.conf':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/carbon.amqp.conf.example',
            notify  => Service["graphite"];

        '/opt/graphite/webapp/graphite/graphite.wsgi':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/graphite.wsgi.example',
            notify  => Service["graphite"];

        '/opt/graphite/conf/storage-aggregation.conf':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/storage-aggregation.conf.example',
            notify  => Service["graphite"];

        '/opt/graphite/conf/graphTemplates.conf':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/graphTemplates.conf.example',
            notify  => Service["graphite"];

        '/opt/graphite/conf/rewrite-rules.conf':
            ensure  => present,
            replace => 'false',
            owner   => 'graphite',
            group   => 'graphite',
            mode    => '0644',
            source  =>  'file:////opt/graphite/conf/rewrite-rules.conf.example',
            notify  => Service["graphite"];
    } ->
    file { 
        '/opt/graphite/conf/carbon.conf':
            ensure      => file,
            replace     => 'true',
            owner       => 'graphite',
            group       => 'graphite',
            mode        => '0644',
            content     => template("graphite/carbon.conf.erb"),
            notify      => Service["graphite"];

        '/opt/graphite/conf/dashboard.conf':
            ensure      => file,
            replace     => 'true',
            owner       => 'graphite',
            group       => 'graphite',
            mode        => '0644',
            content     => template("graphite/dashboard.conf.erb"),
            notify      => Service["graphite"];

        '/opt/graphite/conf/storage-schemas.conf':
            ensure      => file,
            replace     => 'true',
            owner       => 'graphite',
            group       => 'graphite',
            mode        => '0644',
            content     => template("graphite/storage-schemas.conf.erb"),
            notify      => Service["graphite"];

        '/opt/graphite/webapp/graphite/local_settings.py':
            ensure      => file,
            replace     => 'true',
            owner       => 'graphite',
            group       => 'graphite',
            mode        => '0644',
            content     => template("graphite/local_settings.py.erb"),
            notify      => Exec['graphite syncdb'];

        '/opt/graphite/conf/uwsgi.ini':
            ensure      => file,
            replace     => 'true',
            owner       => 'graphite',
            group       => 'graphite',
            mode        => '0644',
            content     => template("graphite/uwsgi.ini.erb"),
            notify      => Service["graphite"];

        '/opt/graphite/storage':
            owner       => $uwsgi_uid,
            group       => $uwsgi_gid,
            recurse     => true,
            replace     => false,
            ensure      => directory;
    } ->
    exec { 
        'graphite syncdb':
            path        => "${path}",
            cwd         => "/opt/graphite/webapp/graphite",
            command     => '/usr/bin/python27 manage.py migrate auth && /usr/bin/python27 /opt/graphite/webapp/graphite/manage.py syncdb --noinput && /bin/touch /root/.graphite_syncdb',
#            subscribe   => File['/opt/graphite/webapp/graphite/local_settings.py'],
            refreshonly => true,
            creates     => "/root/.graphite_syncdb",
            notify      => Service["graphite"];
    }
}
