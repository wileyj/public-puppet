class grafana::params{
    $files                            = hiera('grafana::files', {})
    $sudo                             = hiera('grafana::sudo::conf', {})
    $cron                             = hiera('grafana::cron::job', {})
    $sysctl                           = hiera('grafana::sysctl', {})
    $packages                         = hiera('grafana::packages',[])
    $services                         = hiera('grafana::services',[])
    $golang_modules                   = hiera('grafana::golang::modules',[])
    $nodejs_modules                   = hiera('grafana::nodejs::modules',[])
    $gopath                           = hiera('env::gopath')
    $config_location                  = hiera('grafana::config::location')

    # defaults.ini
    # paths
    $paths_data                       = hiera('grafana::paths::data')
    $paths_logs                       = hiera('grafana::paths::logs')

    # server
    $server_protocol                  = hiera('grafana::server::protocol')
    $server_http_addr                 = hiera('grafana::server::http_addr')
    $server_http_port                 = hiera('grafana::server::http_port')
    $server_domain                    = hiera('grafana::server::domain')
    $server_enforce_domain            = hiera('grafana::server::enforce_domain')
    $server_root_url                  = hiera('grafana::server::root_url')
    $server_router_logging            = hiera('grafana::server::router_logging')
    $server_static_root_path          = hiera('grafana::server::static_root_path')
    $server_enable_gzip               = hiera('grafana::server::enable_gzip')
    $server_cert_file                 = hiera('grafana::server::cert_file')
    $server_cert_key                  = hiera('grafana::server::cert_key')

    # database
    $database_type                    = hiera('grafana::database::type')
    $database_host                    = hiera('grafana::database::host')
    $database_name                    = hiera('grafana::database::name')
    $database_user                    = hiera('grafana::database::user')
    $database_password                = hiera('grafana::database::password')
    $database_ssl_mode                = hiera('grafana::database::ssl_mode')
    $database_path                    = hiera('grafana::database::path')

    # session
    $session_provider                 = hiera('grafana::session::provider')
    $session_provider_config          = hiera('grafana::session::provider_config')
    $session_cookie_name              = hiera('grafana::session::cookie_name')
    $session_cookie_secure            = hiera('grafana::session::cookie_secure')
    $session_life_time                = hiera('grafana::session::session_life_time')

    # analytics
    $analytics_reporting_enabled      = hiera('grafana::analytics::reporting_enabled')
    $analytics_google_analytics_ua_id = hiera('grafana::analytics::google_analytics_ua_id')
    $analytics_google_tag_manager_id  = hiera('grafana::analytics::google_tag_manager_id')

    # security 
    $security_admin_user              = hiera('grafana::security::admin_user')
    $security_admin_password          = hiera('grafana::security::admin_password')
    $security_secret_key              = hiera('grafana::security::secret_key')
    $security_login_remember_days     = hiera('grafana::security::login_remember_days')
    $security_cookie_username         = hiera('grafana::security::cookie_username')
    $security_cookie_remember_name    = hiera('grafana::security::cookie_remember_name')
    $security_disable_gravatar        = hiera('grafana::security::disable_gravatar')

    # users
    $users_allow_sign_up              = hiera('grafana::users::allow_sign_up')
    $users_allow_org_creat            = hiera('grafana::users::allow_org_create')
    $users_auto_assign_org            = hiera('grafana::users::auto_assign_org')
    $users_auto_assign_org_role       = hiera('grafana::users::auto_assign_org_role')
    $users_verify_email_enabled       = hiera('grafana::users::verify_email_enabled')

    # auth.anonymous
    $anonymous_enabled                = hiera('grafana::auth::anonymous::enabled')
    $anonymous_org_name               = hiera('grafana::auth::anonymous::org_name')
    $anonymous_org_role               = hiera('grafana::auth::anonymous::org_role')

    # auth.github
    $github_enabled                   = hiera('grafana::auth::github::enabled')
    $github_allow_sign_up             = hiera('grafana::auth::github::allow_sign_up')
    $github_client_id                 = hiera('grafana::auth::github::client_id')
    $github_client_secret             = hiera('grafana::auth::github::client_secret')
    $github_scopes                    = hiera('grafana::auth::github::scopes')
    $github_auth_url                  = hiera('grafana::auth::github::auth_url')
    $github_token_url                 = hiera('grafana::auth::github::token_url')
    $github_api_url                   = hiera('grafana::auth::github::api_url')
    $github_team_ids                  = hiera('grafana::auth::github::team_ids')
    $github_allowed_organizations     = hiera('grafana::auth::github::allowed_organizations')

    # auth.google
    $google_enabled                   = hiera('grafana::auth::google::enabled')
    $google_allow_sign_up             = hiera('grafana::auth::google::allow_sign_up')
    $google_client_id                 = hiera('grafana::auth::google::client_id')
    $google_client_secret             = hiera('grafana::auth::google::client_secret')
    $google_scopes                    = hiera('grafana::auth::google::scopes')
    $google_auth_url                  = hiera('grafana::auth::google::auth_url')
    $google_token_url                 = hiera('grafana::auth::google::token_url')
    $google_api_url                   = hiera('grafana::auth::google::api_url')
    $google_allowed_domains           = hiera('grafana::auth::google::allowed_domains')

    # auth.basic
    $auth_basic_enabled               = hiera('grafana::auth::basic::enabled')

    # smtp
    $smtp_enabled                     = hiera('grafana::smtp::enabled')
    $smtp_host                        = hiera('grafana::smtp::host')
    $smtp_user                        = hiera('grafana::smtp::user')
    $smtp_password                    = hiera('grafana::smtp::password')
    $smtp_cert_file                   = hiera('grafana::smtp::cert_file')
    $smtp_key_file                    = hiera('grafana::smtp::key_file')
    $smtp_skip_verify                 = hiera('grafana::smtp::skip_verify')
    $smtp_from_address                = hiera('grafana::smtp::from_address')

    # emails
    $emails_welcome_email_on_sign_up  = hiera('grafana::emails::welcome_email_on_sign_up')
    $emails_templates_pattern         = hiera('grafana::emails::templates_pattern')

    # logs
    $logs_mode                        = hiera('grafana::log::mode',[])
    $logs_buffer_len                  = hiera('grafana::log::buffer_len')
    $logs_level                       = hiera('grafana::log::level')

    # log.console
    $logconsole_level                 = hiera('grafana::logconsole::level')

    # log.file
    $logfile_level                    = hiera('grafana::logfile::level')
    $logfile_rotate                   = hiera('grafana::logfile::rotate')
    $logfile_max_lines                = hiera('grafana::logfile::max_lines')
    $logfile_max_lines_shift          = hiera('grafana::logfile::max_lines_shift')
    $logfile_daily_rotate             = hiera('grafana::logfile::daily_rotate')
    $logfile_max_days                 = hiera('grafana::logfile::max_days')

    # amqp
    $amqp_enabled                     = hiera('grafana::amqp::enabled')
    $amqp_url                         = hiera('grafana::amqp::url')
    $amqp_exchange                    = hiera('grafana::amqp::exchange')

    # dashboard
    $dashboards_enabled               = hiera('grafana::dashboards::enabled')
    $dashboards_path                  = hiera('grafana::dashboards::path')

    # host specific config
    $host_files                       = hiera('host::files', {})
    $host_sudo                        = hiera('host::sudo::conf', {})
    $host_cron                        = hiera('host::cron::job', {})
    $host_users                       = hiera('host::users', {})
    $host_groups                      = hiera('host::groups', {})
    $host_sysctl                      = hiera('host::sysctl', {})
    $host_packages                    = hiera('host::packages',[])
    $host_python_modules              = hiera('host::python_modules',[])
    $host_nodejs_modules              = hiera('host::nodejs_modules',[])
    $host_golang_modules              = hiera('host::golang_modules',[])
    $host_services                    = hiera('host::services',[])
    $host_iptables                    = hiera('host::iptables', {})
    $host_keys                        = hiera('host::keys',{})
}
