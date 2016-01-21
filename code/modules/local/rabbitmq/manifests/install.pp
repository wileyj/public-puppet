# Class rabbitmq::install
# Ensures the rabbitmq-server exists
class rabbitmq::install {

  $package_ensure   = $rabbitmq::package_ensure
  $package_name     = $rabbitmq::package_name
  $package_provider = $rabbitmq::package_provider
  $package_source   = $rabbitmq::real_package_source

  #   notify{"  Cleaning Erlang Yum Cache " : }
  # exec { 'yum-clean-erlang-cache':
  #         user => 'root',
  #         path => '/usr/bin',
  #         command => 'yum clean expire-cache',
  #   }->
  package { 
    'rabbitmq-server':
      ensure   => $package_ensure,
      name     => $package_name,
      provider => $package_provider,
      notify   => Class['rabbitmq::service'];
  }

  if $package_source {
    Package['rabbitmq-server'] {
      source  => $package_source,
    }
  }

}
