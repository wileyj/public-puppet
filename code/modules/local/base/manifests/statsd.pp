class base::statsd {
    class { 'nodejs': } ->
    class { 
        'statsd':
            port                     => hiera('statsd::config::port'),
            mgmt_port                => hiera('statsd::config::mgmt_port'),
            debug                    => hiera('statsd::config::debug'),
            statsd_title             => hiera('statsd::config::statsd_title'),
            healthStatus             => hiera('statsd::config::healthStatus'),
            dumpMessages             => hiera('statsd::config::dumpMessages'),
            flushInterval            => hiera('statsd::config::flushInterval'),
            percentThreshold         => hiera('statsd::config::percentThreshold',[]),
            flush_counts             => hiera('statsd::config::flush_counts'),
            graphiteHost             => hiera('sensu::services::graphite::host'),
            graphitePort             => hiera('sensu::services::graphite::port'),
            graphite_legacyNamespace => hiera('statsd::config::graphite::legacyNamespace'),
            graphite_globalPrefix    => hiera('statsd::config::graphite::globalPrefix'),
            graphite_prefixCounter   => hiera('statsd::config::graphite::prefixCounter'),
            graphite_prefixGauge     => hiera('statsd::config::graphite::prefixGauge'),
            graphite_prefixSet       => hiera('statsd::config::graphite::prefixSet')
    }
}

