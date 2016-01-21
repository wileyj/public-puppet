class uchiwa::templates (
    $files                  = hiera('uchiwa::files', {}),
    $sensu_user             = hiera('sensu::users',{}),
    $sensu_group            = hiera('sensu::groups',{}),
    $sensu_host             = hiera('sensu::host'),
    $api_port               = hiera('sensu::api::port'),
    $api_user               = hiera('sensu::api::user'),
    $api_password           = hiera('sensu::api::password'),
    $sensu_use_ssl          = hiera('uchiwa::app::use_ssl'),
    $sensu_path             = hiera('uchiwa::app::path'),
    $sensu_timeout          = hiera('uchiwa::app::timeout'),
    $uchiwa_port            = hiera('uchiwa::app::port'),
    $uchiwa_stats           = hiera('uchiwa::app::stats'),
    $uchiwa_refresh         = hiera('uchiwa::app::refresh'),
    $uchiwa_script_dir      = hiera('uchiwa::script_dir'),
    $uchiwa_admin_user      = hiera('uchiwa::app::admin_user'),
    $uchiwa_admin_password  = hiera('uchiwa::app::admin_password'),
    $uchiwa_app_users       = hiera('uchiwa::app::users',{}),
    $uchiwa_app_datacenters = hiera('uchiwa::app::datacenters',{}),
) {
    create_resources('file',$files)
    file {
        '/opt/uchiwa/config.json':
            owner   => "uchiwa",
            replace => "true",
            group   => "sensu",
            mode    => "0644",
            content => template('uchiwa/config.json.erb'),
            notify  => Service["uchiwa"];
    }
}