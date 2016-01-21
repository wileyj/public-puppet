class grafana::sumo {
    # file{
    #     "/etc/sumo.d/grafana_app_grafana.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/grafana_app_grafana.json.erb");
            
    #     "/etc/sumo.d/grafana_nginx_access.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/grafana_nginx_access.json.erb");
            
    #     "/etc/sumo.d/grafana_nginx_error.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/grafana_nginx_error.json.erb");
    # }
}
