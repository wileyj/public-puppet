class base {
    include($classes)
    class { 'base::hostname': }  ->
    class { 'base::packages': }  ->
    class { 'base::modules': }   ->
    class { 'base::templates': } ->
    class { 'base::users': }     ->
    class { 'jenkins::users': }  ->
    class { 'base::sysctl': }    ->
    class { 'base::denyhosts': } ->
    class { 'base::hosts': }     ->
    class { 'base::services': }  ->
    #class { 'base::host': }     ->
    class { 'base::collectd': }  ->
    class { 'base::statsd': }    ->
    class { 'base::sudo': }      ->
    class { 'base::cron': }      ->
    class { 'base::sumo': }
    if $tag_beanstalk_id != "None" {
        class { 'roles::beanstalk': }
    }    
}

