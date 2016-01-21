class uchiwa::modules(
    $golang_modules     = hiera('uchiwa::golang::modules',[]),
    $uchiwa_script_dir  = hiera('uchiwa::script_dir'),
    $gopath             = hiera('env::gopath'),
) {
    package {
        $golang_modules:
            require => Package["golang"],
            ensure  => latest,
            provider => go;
    }->
    exec {
        'Install godep':
            command => "/usr/bin/go get github.com/tools/godep",
            cwd     => $gopath,
            require => Package["golang"],
            creates => "${gopath}/github.com/tools/godep";

        'Install Uchiwa':
            command => "/usr/bin/go get github.com/sensu/uchiwa",
            cwd     => $gopath,
            require => Package["golang"],
            creates => $uchiwa_script_dir;

        'Install uchiwa symlink':
            command => "/bin/ln -s $uchiwa_script_dir /opt/uchiwa && mkdir -p /opt/uchiwa/bin",
            cwd     => $uchiwa_script_dir,
            require => Exec['Install Uchiwa'],
            creates => "/opt/uchiwa";

        'Install uchiwa golang deps':
            command => "/usr/bin/go get -u && touch /opt/uchiwa/.uchiwa_go",
            cwd     => $uchiwa_script_dir,
            require => Exec['Install uchiwa symlink'],
            creates => "/opt/uchiwa/.uchiwa_go";

        'Install uchiwa node deps':
            command => "/usr/bin/npm install --production --unsafe-perm && touch /opt/uchiwa/.uchiwa_node",
            cwd     => $uchiwa_script_dir,
            require => Exec['Install uchiwa symlink'],
            creates => "/opt/uchiwa/.uchiwa_node";
    }
}