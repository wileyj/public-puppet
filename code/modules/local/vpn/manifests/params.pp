class vpn::params{
    $service_use1            = hiera('vpn::use1::service::origin::name')
    $db_use1                 = hiera('vpn::use1::db::origin::name')
    $service_usw1            = hiera('vpn::usw1::service::app::name')
    $db_usw1                 = hiera('vpn::usw1::db::app::name')
    $service_usw2            = hiera('vpn::usw2::service::app::name')
    $db_usw2                 = hiera('vpn::usw2::db::app::name')
    $service_ase1            = hiera('vpn::ase1::service::app::name')
    $db_ase1                 = hiera('vpn::ase1::db::app::name')
    $files                   = hiera('vpn::files', [])
    $cron                    = hiera('vpn::cron::job', [])
    $sysctl_values           = hiera('sysctl::vpn::values',{})
    $packages                = hiera('vpn::packages','')
    $services                = hiera('vpn::services','')

    #common vars
    $forceencaps             = hiera('vpn::config::forceencaps')
    $aggrmode                = hiera('vpn::config::aggrmode')
    $authby                  = hiera('vpn::config::authby')
    $auto                    = hiera('vpn::config::auto')
    $type                    = hiera('vpn::config::type')
    $ike                     = hiera('vpn::config::ike')
    $phase2alg               = hiera('vpn::config::phase2alg')
    $dpddelay                = hiera('vpn::config::dpddelay')
    $dpdtimeout              = hiera('vpn::config::dpdtimeout')
    $dpdaction               = hiera('vpn::config::dpdaction')
    $config_name             = hiera('vpn::config::name')
    $public                  = hiera('vpn::config::public')
    $public_subnet           = hiera('vpn::config::subnet')
    $private_ip              = hiera('vpn::config::private')
    $source_key              = hiera('vpn::source::key')
    $dest_key                = hiera('vpn::dest::key')

    #use1 service
    $use1_service_origin_name       = hiera('vpn::use1::service::origin::name')
    $use1_service_origin_conn       = hiera('vpn::use1::service::origin::conn')
    $use1_service_origin_public     = hiera('vpn::use1::service::origin::public')
    $use1_service_origin_subnet     = hiera('vpn::use1::service::origin::subnet')
    
    #use1 db
    $use1_db_origin_name            = hiera('vpn::use1::db::origin::name')
    $use1_db_origin_conn            = hiera('vpn::use1::db::origin::conn')
    $use1_db_origin_public          = hiera('vpn::use1::db::origin::public')
    $use1_db_origin_subnet          = hiera('vpn::use1::db::origin::subnet')
    
    #usw1 service
    $usw1_service_app_name       = hiera('vpn::usw1::service::app::name')
    $usw1_service_app_conn       = hiera('vpn::usw1::service::app::conn')
    $usw1_service_app_public     = hiera('vpn::usw1::service::app::public')
    $usw1_service_app_subnet     = hiera('vpn::usw1::service::app::subnet')
    
    #usw1 db
    $usw1_db_app_name            = hiera('vpn::usw1::db::app::name')
    $usw1_db_app_conn            = hiera('vpn::usw1::db::app::conn')
    $usw1_db_app_public          = hiera('vpn::usw1::db::app::public')
    $usw1_db_app_subnet          = hiera('vpn::usw1::db::app::subnet')

    #usw2 service
    $usw2_service_app_name       = hiera('vpn::usw2::service::app::name')
    $usw2_service_app_conn       = hiera('vpn::usw2::service::app::conn')
    $usw2_service_app_public     = hiera('vpn::usw2::service::app::public')
    $usw2_service_app_subnet     = hiera('vpn::usw2::service::app::subnet')
    
    #usw2 service
    $usw2_service_db_name       = hiera('vpn::usw2::service::db::name')
    $usw2_service_db_conn       = hiera('vpn::usw2::service::db::conn')
    $usw2_service_db_public     = hiera('vpn::usw2::service::db::public')
    $usw2_service_db_subnet     = hiera('vpn::usw2::service::db::subnet')
    
    #usw2 db
    $usw2_db_app_name            = hiera('vpn::usw2::db::app::name')
    $usw2_db_app_conn            = hiera('vpn::usw2::db::app::conn')
    $usw2_db_app_public          = hiera('vpn::usw2::db::app::public')
    $usw2_db_app_subnet          = hiera('vpn::usw2::db::app::subnet')

    #ase1 service
    $ase1_service_app_name       = hiera('vpn::ase1::service::app::name')
    $ase1_service_app_conn       = hiera('vpn::ase1::service::app::conn')
    $ase1_service_app_public     = hiera('vpn::ase1::service::app::public')
    $ase1_service_app_subnet     = hiera('vpn::ase1::service::app::subnet')
    
    #ase1 db
    $ase1_db_app_name            = hiera('vpn::ase1::db::app::name')
    $ase1_db_app_conn            = hiera('vpn::ase1::db::app::conn')
    $ase1_db_app_public          = hiera('vpn::ase1::db::app::public')
    $ase1_db_app_subnet          = hiera('vpn::ase1::db::app::subnet')
    
    # ipsec.secrets
    $source_modulus          = hiera('vpn::source::modulus')
    $source_public_exponent  = hiera('vpn::source::public::exponent')
    $source_private_exponent = hiera('vpn::source::private::exponent')
    $source_prime1           = hiera('vpn::source::prime1')
    $source_prime2           = hiera('vpn::source::prime2')
    $source_exponent1        = hiera('vpn::source::exponent1')
    $source_exponent2        = hiera('vpn::source::exponent2')
    $source_coefficient      = hiera('vpn::source::coefficient')
    $source_ckaidnss         = hiera('vpn::source::ckaidnss')
    
    # ipsec.secrets
    $dest_modulus            = hiera('vpn::dest::modulus')
    $dest_public_exponent    = hiera('vpn::dest::public::exponent')
    $dest_private_exponent   = hiera('vpn::dest::private::exponent')
    $dest_prime1             = hiera('vpn::dest::prime1')
    $dest_prime2             = hiera('vpn::dest::prime2')
    $dest_exponent1          = hiera('vpn::dest::exponent1')
    $dest_exponent2          = hiera('vpn::dest::exponent2')
    $dest_coefficient        = hiera('vpn::dest::coefficient')
    $dest_ckaidnss           = hiera('vpn::dest::ckaidnss')
    
    # host specific config
    $host_files              = hiera('host::files', {})
    $host_sudo               = hiera('host::sudo::conf', {})
    $host_cron               = hiera('host::cron::job', {})
    $host_users              = hiera('host::users', {})
    $host_groups             = hiera('host::groups', {})
    $host_sysctl             = hiera('host::sysctl', {})
    $host_packages           = hiera('host::packages','')
    $python_modules          = hiera('host::python_modules','')
    $nodejs_modules          = hiera('host::nodejs_modules','')
    $host_services           = hiera('host::services','')
    $host_iptables           = hiera('host::iptables', {})
    $host_keys               = hiera('host::keys',{})
}
