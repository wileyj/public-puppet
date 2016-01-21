class beanstalk::templates(
    $files               = hiera('beanstalk::files', {}),
    $beanstalk_xmx       = hiera('beanstalk::xmx'),
    $beanstalk_xms       = hiera('beanstalk::xms'),
    $beanstalk_permgen   = hiera('beanstalk::permgen'),
){
    #create_resources('file',$files)
    $beanstalk_appname = $server_class ? {
        "app"      => "App",
        "Default"    => "App"
    } ->
    $beanstalk_env = $::tag_environment ? {
        "dev"        => "Dev",
        "production" => "Prod",
        "staging"    => "Staging",
        "Default"    => "Dev"
    } ->
    file{     
        "/etc/sysconfig/tomcat8":
            ensure   => file,
            replace  => 'true',
            owner    => 'root',
            group    => 'root',
            mode     => '0600',
            content  => template("beanstalk/tomcat8.erb");
            #notify   => Service["tomcat8"]; 
    }
}
