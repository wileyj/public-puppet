class grafana::files inherits grafana::params{
    file { 
        '/etc/grafana':
            ensure => link,
            target => "${gopath}/src/github.com/grafana/grafana/conf",
            replace=> true;

        '/var/lib/grafana':
            ensure => link,
            target => "${gopath}/src/github.com/grafana/grafana/data",
            replace=> true;

        '/var/log/grafana':
            ensure => link,
            target => "${gopath}/src/github.com/grafana/grafana/data/log",
            replace=> true;

        # '/etc/grafana/defaults.ini':
        #     ensure  => present,
        #     replace => true,
        #     owner   => 'graphite',
        #     group   => 'graphite',
        #     mode    => '0644',
        #     source  =>  'puppet:///modules/grafana/defaults.ini'
    }
}
