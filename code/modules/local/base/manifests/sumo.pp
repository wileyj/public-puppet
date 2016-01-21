class base::sumo {
    file{
        "/etc/sumo.d/cron.json":
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            require => File['/etc/sumo.d'],
            content => template("sumo/cron.json.erb");
            
        "/etc/sumo.d/denyhosts.json":
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            require => File['/etc/sumo.d'],
            content => template("sumo/denyhosts.json.erb");
            
        "/etc/sumo.d/messages.json":
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            require => File['/etc/sumo.d'],
            content => template("sumo/messages.json.erb");
    }
}
