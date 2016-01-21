class bastion::packages(
    $packages = hiera('bastion::packages',[]),
) {
    exec { 
        'yum-clean-expire-cache':
            user => 'root',
            path => '/usr/bin',
            command => 'yum clean expire-cache';
    } ->
    package {
        $packages:
            ensure  => latest;
    }
}

