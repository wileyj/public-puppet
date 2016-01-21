class tomcat::users inherits tomcat::params {
    create_resources(group, $tomcat_groups)
    create_resources(user, $tomcat_users)
}
