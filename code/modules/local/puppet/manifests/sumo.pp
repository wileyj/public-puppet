class puppet::sumo {
    # file{
    #     "/etc/sumo.d/puppet.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/puppet.json.erb");
    # }
}
