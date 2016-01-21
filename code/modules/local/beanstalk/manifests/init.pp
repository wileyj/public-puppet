class beanstalk {
    include($classes)
    exec {
        'Commenting Log Rotation to S3':
            command => "/bin/sed -i -e 's/^\\([^\\#]\\)/#\\1/g' /etc/cron.d/publishlogs";
    } ->
    class { 'beanstalk::templates': } ->
    class { 'beanstalk::packages': } ->
    #class { 'beanstalk::templates': } ->
    class { 'beanstalk::services': } ->
    class { 'beanstalk::sumo': } ->
    class { 'beanstalk::files': } 
}
