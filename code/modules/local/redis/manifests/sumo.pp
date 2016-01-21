class redis::sumo {
    # file{
    #     "/etc/sumo.d/redis_app.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/redis_app.json.erb");
    # }
}