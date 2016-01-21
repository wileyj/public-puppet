class grafana::exec {
    exec {
        'grafana init':
            path        => "${path}",
            cwd         => "${gopath}src/github.com/grafana/grafana",
            command     => "bash -c 'cd ${gopath}/src/github.com/grafana/grafana; /usr/bin/go run build.go setup; /bin/touch /root/.grafanainit'",
            onlyif      => [ "/usr/bin/test -f ${gopath}/src/github.com/grafana/grafana/build.go"],
            creates     => "/root/.grafanainit";

        'grafana build':
            path        => "${path}",
            cwd         => "${gopath}src/github.com/grafana/grafana",
            command     => "bash -c 'cd ${gopath}/src/github.com/grafana/grafana; /usr/bin/go build .; /bin/touch /root/.grafanabuild'",
            onlyif      => [ "/usr/bin/test -f ${gopath}/src/github.com/grafana/grafana/build.go" ],
            creates     => "/root/.grafanabuild";

        'grafana node install':
            path        => "${path}",
            cwd         => "${gopath}src/github.com/grafana/grafana",
            command     => "bash -c 'cd ${gopath}/src/github.com/grafana/grafana; /usr/bin/npm install; /bin/touch /root/.grafananode'",
            onlyif      => [ "/usr/bin/test ! -d ${gopath}/src/github.com/grafana/grafana/node_modules" ],
            creates     => "/root/.grafananode";
    
        'grafana grunt':
            path        => "${path}",
            cwd         => "${gopath}src/github.com/grafana/grafana",
            command     => "bash -c 'cd ${gopath}/src/github.com/grafana/grafana; /usr/bin/grunt --force; /bin/touch /root/.grafanagrunt'",
            onlyif      => [ "/usr/bin/test -f ${gopath}/src/github.com/grafana/grafana/Gruntfile.js"],
            creates     => "/root/.grafanagrunt";
    } ->
    file {
        '/usr/lib/golang/src/github.com/grafana/grafana/data':
            ensure      => directory,
            owner       => 'graphite',
            group       => 'graphite',
            mode        => '0755';

        '/usr/lib/golang/src/github.com/grafana/grafana/data/log':
            ensure      => directory,
            owner       => 'graphite',
            group       => 'graphite',
            mode        => '0755';

        '/usr/lib/golang/src/github.com/grafana/grafana/data/dashboards':
            ensure      => directory,
            owner       => 'graphite',
            group       => 'graphite',
            mode        => '0755';
    }
}