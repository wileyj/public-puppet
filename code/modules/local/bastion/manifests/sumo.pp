class bastion::sumo {
    # file{
    #     "/etc/sumo.d/yum.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/yum.json.erb");
    # }
}
