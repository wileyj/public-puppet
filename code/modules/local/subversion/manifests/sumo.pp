class subversion::sumo {
    # file{
    #     "/etc/sumo.d/subversion_app.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/subversion_app.json.erb");
    # }
}
