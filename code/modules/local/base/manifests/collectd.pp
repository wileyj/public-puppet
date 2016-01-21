class base::collectd (
    $graphitehost      = hiera('sensu::services::graphite::host'),
    $graphiteport      = hiera('sensu::services::graphite::port'),
    $graphiteprefix    = hiera('collectd::config::graphiteprefix'),
    $escapecharacter   = hiera('collectd::config::escapecharacter'),
    $storerates        = hiera('collectd::config::storerates'),
    $alwaysappendds    = hiera('collectd::config::alwaysappendds'),
    $separateinstances = hiera('collectd::config::separateinstances'),
    $logsenderrors     = hiera('collectd::config::logsenderrors'),
    $protocol          = hiera('collectd::config::protocol'),
) {
    class { 
        'collectd':
            purge             => true,
            recurse           => true,
            purge_config      => true,
            fqdnlookup	      => false,
            collectd_hostname => $::fqdn,
    } 
    collectd::plugin { 'cpu': }
    collectd::plugin { 'cpufreq': }
    collectd::plugin { 'disk': }
    collectd::plugin { 'entropy': }
    collectd::plugin { 'interface': }
    collectd::plugin { 'load': }
    collectd::plugin { 'lvm': }
    collectd::plugin { 'memory': }
    collectd::plugin { 'protocols': }
    collectd::plugin { 'statsd': }
    collectd::plugin { 'swap': }
    collectd::plugin { 'uptime': }
    collectd::plugin { 'vmem': }
    collectd::plugin::write_graphite::carbon {
        'graphite':
            graphitehost      => $graphitehost,
            graphiteport      => $graphiteport,
            graphiteprefix    => $graphiteprefix,
            escapecharacter   => $escapecharacter,
            storerates        => $storerates,
            alwaysappendds    => $alwaysappendds,
            separateinstances => $separateinstances,
            logsenderrors     => $logsenderrors,
            protocol          => $protocol
    }
}
