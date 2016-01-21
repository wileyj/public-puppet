class tomcat inherits tomcat::params {
    class { 'tomcat::users': } ->
    class { 'tomcat::packages': } ->
    class { 'tomcat::services': } ->
    class { 'tomcat::sumo': }
    create_resources('file',$tomcat_files)
    create_resources('sudo::conf',$tomcat_sudo)
    create_resources('cron::job',$tomcat_cron)
}


