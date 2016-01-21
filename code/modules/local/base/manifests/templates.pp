 class base::templates(
    $files     = hiera('common::files', {}),
    $gopath    = hiera('env::gopath'),
    $facterlib = hiera('env::facterlib'),
    $path      = hiera('env::path'),
){
    create_resources('file',$files)
    file{   
        '/etc/environment':
            ensure  => file,
            replace => true,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => template('base/environment.erb');

        '/etc/profile':
            ensure  => file,
            replace => true,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => template('base/profile.erb');

    }
}
