class ssh::sumo {
    file{
        "/etc/sumo.d/secure.json":
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => template("sumo/secure.json.erb");
    }
}
