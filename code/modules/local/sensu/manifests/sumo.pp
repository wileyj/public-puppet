class sensu::sumo{
    # file{
    #     "/etc/sumo.d/sensu_app_client.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/sensu_app_client.json.erb");
    # }
    # if $server_role == "sensu" {
    #     file {
    #         "/etc/sumo.d/sensu_app_api.json":
    #             ensure  => file,
    #             replace => 'true',
    #             owner   => 'root',
    #             group   => 'root',
    #             mode    => '0644',
    #             content => template("sumo/sensu_app_api.json.erb");

    #         "/etc/sumo.d/sensu_app_server.json":
    #             ensure  => file,
    #             replace => 'true',
    #             owner   => 'root',
    #             group   => 'root',
    #             mode    => '0644',
    #             content => template("sumo/sensu_app_server.json.erb");
    #     }
    # }
}
