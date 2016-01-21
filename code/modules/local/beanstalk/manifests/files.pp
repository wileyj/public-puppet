class beanstalk::files(
    $files = hiera('beanstalk::files', {}),
){
    create_resources('file',$files)

    # Site-specific that will be used to notify httpd to restart if changed
    #file {
    #    '/etc/httpd/conf.d/maskendpoints.conf':
    #        source  => 'puppet:///modules/beanstalk/etc/httpd/conf.d/maskendpoints.conf',
    #        ensure  => present,
    #        owner   => 'root',
    #        group   => 'root',
    #        replace => true,
    #        mode    => '0644',
    #        notify  => Service["httpd"]
    #}
}

