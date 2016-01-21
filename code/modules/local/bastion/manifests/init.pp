class bastion {
    include($classes)
    class { 'base::hostname': }  ->
    class { 'bastion::packages': }  ->
    class { 'bastion::templates': } ->
    class { 'bastion::users': }     ->
    class { 'base::sysctl': }    ->
    class { 'base::denyhosts': } ->
    class { 'bastion::services': }  ->
    #class { 'bastion::host': }     ->
    class { 'bastion::rzshenv': } ->
    class { 'base::collectd': }  ->
    class { 'base::statsd': }  ->
    class { 'base::sudo': }      ->
    class { 'bastion::cron': }      ->
    class { 'bastion::sumo': }

    create_resources('file',$files)
    create_resources('sudo::conf',$sudo)
    create_resources('cron::job',$cron)
    create_resources(sysctl::value,$sysctl)
}