class uchiwa::sumo {
    # file{
    #      "/etc/sumo.d/uchiwa_app.json":
    #          ensure  => file,
    #          replace => 'true',
    #          owner   => 'root',
    #          group   => 'root',
    #          mode    => '0644',
    #          content => template("sumo/uchiwa_app.json.erb");
    # }
}
