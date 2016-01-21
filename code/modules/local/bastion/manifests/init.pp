class bastion inherits bastion::params {
    # notify{"  Bastion Module " : } ->
    include($classes)
    class { 'bastion::packages': } ->
    class { 'bastion::modules': } ->
    class { 'bastion::users': } ->
    class { 'bastion::scripts': } ->
    class { 'bastion::ssh': } ->
    class { 'bastion::rzshenv': } ->
    class { 'bastion::sumo': }
    create_resources('file',$files)
    create_resources('sudo::conf',$sudo)
    create_resources('cron::job',$cron)
    create_resources(sysctl::value,$sysctl)
}