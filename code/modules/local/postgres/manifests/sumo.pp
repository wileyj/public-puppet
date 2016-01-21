class postgres::sumo {
    # file{
    #     "/etc/sumo.d/postgres.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/postgres.json.erb");
    # }
}
