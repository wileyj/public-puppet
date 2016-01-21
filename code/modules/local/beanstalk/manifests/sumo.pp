class beanstalk::sumo {
    file{
        "/etc/sumo.d/beanstalk_tomcat_catalina.json":
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => template("sumo/beanstalk_tomcat_catalina.json.erb");

        # "/etc/sumo.d/beanstalk_apache_access.json":
        #     ensure  => file,
        #     replace => 'true',
        #     owner   => 'root',
        #     group   => 'root',
        #     mode    => '0644',
        #     content => template("sumo/beanstalk_apache_access.json.erb");
            
        # "/etc/sumo.d/beanstalk_apache_error.json":
        #     ensure  => file,
        #     replace => 'true',
        #     owner   => 'root',
        #     group   => 'root',
        #     mode    => '0644',
        #     content => template("sumo/beanstalk_apache_error.json.erb");

    }
}
