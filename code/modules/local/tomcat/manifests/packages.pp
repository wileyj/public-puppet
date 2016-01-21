class tomcat::packages inherits tomcat::params {
    package {
        $tomcat_packages:
            ensure  => latest;
    }
}
