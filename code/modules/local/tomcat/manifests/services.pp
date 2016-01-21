class tomcat::services inherits tomcat::params {
    service {
        $tomcat_services:
            enable => true,
            path => '/etc/init.d'
    }
}
