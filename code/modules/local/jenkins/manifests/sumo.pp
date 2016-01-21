class jenkins::sumo{
    # file{
    #     "/etc/sumo.d/jenkins.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/jenkins.json.erb");
    # }
}
