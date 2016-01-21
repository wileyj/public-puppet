class tomcat::sumo inherits tomcat::params {
    # file{
    #     "/etc/sumo.d/tomcat8.json":
    #         ensure  => file,
    #         replace => 'true',
    #         owner   => 'root',
    #         group   => 'root',
    #         mode    => '0644',
    #         content => template("sumo/tomcat8.json.erb");
    # }
}
