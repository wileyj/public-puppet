class nginx::sumo{
    # file{
    #     "/etc/sumo.d/nginx_app_access.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/nginx_app_access.json.erb");
    #
    #     "/etc/sumo.d/nginx_app_error.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/nginx_app_error.json.erb");
    # }
}
