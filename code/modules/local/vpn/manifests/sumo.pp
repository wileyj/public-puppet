class vpn::sumo {
    # file{
    #     "/etc/sumo.d/vpn_app.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/vpn_app.json.erb");
    # }
}
