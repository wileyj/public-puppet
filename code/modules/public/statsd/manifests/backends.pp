# == Class: statsd::backends
class statsd::backends {
  $backends = join($statsd::backends, ',')
  $node_base = "${statsd::node_module_dir}/statsd/node_modules"

  # Make sure $statsd::influxdb_host is set
  if $backends =~ /influxdb/ {
    exec { 'install-statsd-influxdb-backend':
      command => '/usr/bin/npm install --save statsd-influxdb-backend',
      cwd     => "${statsd::node_module_dir}/statsd",
      unless  => "/usr/bin/test -d ${node_base}/statsd-influxdb-backend",
      require => Package['statsd'],
    }
  }

  # Make sure $statsd::librato_email and $statsd::librato_token are set
  if $backends =~ /librato/ {
    exec { 'install-statsd-librato-backend':
      command => '/usr/bin/npm install --save statsd-librato-backend',
      cwd     => "${statsd::node_module_dir}/statsd",
      unless  => "/usr/bin/test -d ${node_base}/statsd-librato-backend",
      require => Package['statsd'],
    }
  }

  # Make sure $statsd::stackdriver_apiKey is set
  if $backends =~ /stackdriver/ {
    exec { 'install-statsd-stackdriver-backend':
      command => '/usr/bin/npm install --save stackdriver-statsd-backend',
      cwd     => "${statsd::node_module_dir}/statsd",
      unless  => "/usr/bin/test -d ${node_base}/stackdriver-statsd-backend",
      require => Package['statsd'],
    }
  }
}
