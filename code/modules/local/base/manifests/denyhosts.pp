class base::denyhosts (
    $denyhosts_hosts_deny               = hiera('denyhosts::hosts_deny'),
    $denyhosts_block_service            = hiera('denyhosts::block_service'),
    $denyhosts_work_dir                 = hiera('denyhosts::work_dir'),
    $denyhosts_suspicious_login_report  = hiera('denyhosts::suspicious_login_report'),
    $denyhosts_lock_file                = hiera('denyhosts::lock_file'),
    $denyhosts_secure_log               = hiera('denyhosts::secure_log'),
    $denyhosts_threshold_invalid        = hiera('denyhosts::deny_threshold::invalid'),
    $denyhosts_threshold_valid          = hiera('denyhosts::deny_threshold::valid'),
    $denyhosts_threshold_root           = hiera('denyhosts::deny_threshold::root'),
    $denyhosts_threshold_restricted     = hiera('denyhosts::deny_threshold::restricted'),
    $denyhosts_hostname_lookup          = hiera('denyhosts::hostname_lookup'),
    $denyhosts_syslog_report            = hiera('denyhosts::syslog_report'),
    $denyhosts_age_reset_valid          = hiera('denyhosts::age_reset_valid'),
    $denyhosts_age_reset_root           = hiera('denyhosts::age_reset_root'),
    $denyhosts_age_reset_invalid        = hiera('denyhosts::age_reset_invalid'),
    $denyhosts_reset_on_success         = hiera('denyhosts::reset_on_success'),
    $denyhosts_reset_valid              = hiera('denyhosts::reset_valid'),
    $denyhosts_daemon_log               = hiera('denyhosts::daemon::log'),
    $denyhosts_daemon_sleep             = hiera('denyhosts::daemon::sleep'),
    $denyhosts_daemon_purge             = hiera('denyhosts::daemon::purge'),
    $denyhosts_daemon_log               = hiera('denyhosts::daemon::log'),
    $denyhosts_daemon_log_time_format   = hiera('denyhosts::daemon::log_time_format'),
    $denyhosts_daemon_log_mesage_format = hiera('denyhosts::daemon::log_message_format'),
    $denyhosts_sync_server              = hiera('denyhosts::sync::server'),
    $denyhosts_sync_interval            = hiera('denyhosts::sync::interval'),
    $denyhosts_sync_upload              = hiera('denyhosts::sync::upload'),
    $denyhosts_sync_download            = hiera('denyhosts::sync::download'),
    $denyhosts_sync_download_threshold  = hiera('denyhosts::sync::download_threshold'),
    $denyhosts_sync_download_resiliency = hiera('denyhosts::sync::download_resiliency'),
    $denyhosts_purge_deny               = hiera('denyhosts::purge::deny'),
    $denyhosts_purge_threshold          = hiera('denyhosts::purge::threshold')
) {
    file {
        '/opt/denyhosts/etc/denyhosts.cfg':
            notify  => Service["denyhosts"],
            ensure  => file,
            replace => true,
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            content => template('base/denyhosts.cfg.erb');
    }
}
