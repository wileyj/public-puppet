class vpn::config(
   $service_use1               = hiera('vpn::use1::service::origin::name'),
   $db_use1                    = hiera('vpn::use1::db::origin::name'),
   $service_usw1               = hiera('vpn::usw1::service::app::name'),
   $db_usw1                    = hiera('vpn::usw1::db::app::name'),
   $service_usw2               = hiera('vpn::usw2::service::app::name'),
   $db_usw2                    = hiera('vpn::usw2::db::app::name'),
   $service_ase1               = hiera('vpn::ase1::service::app::name'),
   $db_ase1                    = hiera('vpn::ase1::db::app::name'),
   $use1_service_origin_name   = hiera('vpn::use1::service::origin::name'),
   $use1_service_origin_conn   = hiera('vpn::use1::service::origin::conn'),
   $use1_service_origin_public = hiera('vpn::use1::service::origin::public'),
   $use1_service_origin_subnet = hiera('vpn::use1::service::origin::subnet'),
   $use1_db_origin_name        = hiera('vpn::use1::db::origin::name'),
   $use1_db_origin_conn        = hiera('vpn::use1::db::origin::conn'),
   $use1_db_origin_public      = hiera('vpn::use1::db::origin::public'),
   $use1_db_origin_subnet      = hiera('vpn::use1::db::origin::subnet'),
   $usw1_service_app_name      = hiera('vpn::usw1::service::app::name'),
   $usw1_service_app_conn      = hiera('vpn::usw1::service::app::conn'),
   $usw1_service_app_public    = hiera('vpn::usw1::service::app::public'),
   $usw1_service_app_subnet    = hiera('vpn::usw1::service::app::subnet'),
   $usw1_db_app_name           = hiera('vpn::usw1::db::app::name'),
   $usw1_db_app_conn           = hiera('vpn::usw1::db::app::conn'),
   $usw1_db_app_public         = hiera('vpn::usw1::db::app::public'),
   $usw1_db_app_subnet         = hiera('vpn::usw1::db::app::subnet'),
   $usw2_service_app_name      = hiera('vpn::usw2::service::app::name'),
   $usw2_service_app_conn      = hiera('vpn::usw2::service::app::conn'),
   $usw2_service_app_public    = hiera('vpn::usw2::service::app::public'),
   $usw2_service_app_subnet    = hiera('vpn::usw2::service::app::subnet'),
   $usw2_service_db_name       = hiera('vpn::usw2::service::db::name'),
   $usw2_service_db_conn       = hiera('vpn::usw2::service::db::conn'),
   $usw2_service_db_public     = hiera('vpn::usw2::service::db::public'),
   $usw2_service_db_subnet     = hiera('vpn::usw2::service::db::subnet'),
   $usw2_db_app_name           = hiera('vpn::usw2::db::app::name'),
   $usw2_db_app_conn           = hiera('vpn::usw2::db::app::conn'),
   $usw2_db_app_public         = hiera('vpn::usw2::db::app::public'),
   $usw2_db_app_subnet         = hiera('vpn::usw2::db::app::subnet'),
   $ase1_service_app_name      = hiera('vpn::ase1::service::app::name'),
   $ase1_service_app_conn      = hiera('vpn::ase1::service::app::conn'),
   $ase1_service_app_public    = hiera('vpn::ase1::service::app::public'),
   $ase1_service_app_subnet    = hiera('vpn::ase1::service::app::subnet'),
   $ase1_db_app_name           = hiera('vpn::ase1::db::app::name'),
   $ase1_db_app_conn           = hiera('vpn::ase1::db::app::conn'),
   $ase1_db_app_public         = hiera('vpn::ase1::db::app::public'),
   $ase1_db_app_subnet         = hiera('vpn::ase1::db::app::subnet'),
   $source_modulus             = hiera('vpn::source::modulus'),
   $source_public_exponent     = hiera('vpn::source::public::exponent'),
   $source_private_exponent    = hiera('vpn::source::private::exponent'),
   $source_prime1              = hiera('vpn::source::prime1'),
   $source_prime2              = hiera('vpn::source::prime2'),
   $source_exponent1           = hiera('vpn::source::exponent1'),
   $source_exponent2           = hiera('vpn::source::exponent2'),
   $source_coefficient         = hiera('vpn::source::coefficient'),
   $source_ckaidnss            = hiera('vpn::source::ckaidnss'),
   $dest_modulus               = hiera('vpn::dest::modulus'),
   $dest_public_exponent       = hiera('vpn::dest::public::exponent'),
   $dest_private_exponent      = hiera('vpn::dest::private::exponent'),
   $dest_prime1                = hiera('vpn::dest::prime1'),
   $dest_prime2                = hiera('vpn::dest::prime2'),
   $dest_exponent1             = hiera('vpn::dest::exponent1'),
   $dest_exponent2             = hiera('vpn::dest::exponent2'),
   $dest_coefficient           = hiera('vpn::dest::coefficient'),
   $dest_ckaidnss              = hiera('vpn::dest::ckaidnss'),
) {
    file { 
        '/etc/ipsec.d/cert8.db':
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0600',
            source  => "puppet:///modules/vpn/etc/ipsec.d/cert8.db.$region_short";

        '/etc/ipsec.d/key3.db':
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0600',
            source  => "puppet:///modules/vpn/etc/ipsec.d/key3.db.$region_short";

        '/etc/ipsec.d/secmod.db':
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0600',
            source  => "puppet:///modules/vpn/etc/ipsec.d/secmod.db.$region_short";

        '/etc/ipsec.secrets':
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0600',
            content => template("vpn/ipsec.secrets.$region_short.erb");

        '/etc/ipsec.conf':
            ensure  => file,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0600',
            source  => "puppet:///modules/vpn/etc/ipsec.conf";

    }
    if $region_short == "use1" {
        $vpc = $network_eth0 ? {
            "10.100.0.0" => "db",
            "10.20.0.0"  => "service",
            "10.0.0.0"   => "use1",
            "10.1.0.0"   => "usw1",
            "10.2.0.0"   => "ase1",
            "10.3.0.0"   => "usw2",
        }
        if $vpc == "service" {
            file{     
                "/etc/ipsec.d/${usw1_service_app_name}":
                    ensure  => file,
                    replace => 'true',
                    owner   => 'root',
                    group   => 'root',
                    mode    => '0600',
                    content => template("vpn/connection.service.usw1-app.erb"); 
                
                "/etc/ipsec.d/${usw2_service_app_name}":
                    ensure  => file,
                    replace => 'true',
                    owner   => 'root',
                    group   => 'root',
                    mode    => '0600',
                    content => template("vpn/connection.service.usw2-app.erb"); 

                "/etc/ipsec.d/${usw2_service_db_name}":
                    ensure  => file,
                    replace => 'true',
                    owner   => 'root',
                    group   => 'root',
                    mode    => '0600',
                    content => template("vpn/connection.service.usw2-db.erb");

                "/etc/ipsec.d/${ase1_service_app_name}":
                    ensure  => file,
                    replace => 'true',
                    owner   => 'root',
                    group   => 'root',
                    mode    => '0600',
                    content => template("vpn/connection.service.ase1-app.erb");
            }
        }
        if $vpc == "db" {
            file {
                "/etc/ipsec.d/${usw1_db_app_name}":
                    ensure  => file,
                    replace => 'true',
                    owner   => 'root',
                    group   => 'root',
                    mode    => '0600',
                    content => template("vpn/connection.db.usw1-app.erb");  

                "/etc/ipsec.d/${usw2_db_app_name}":
                    ensure  => file,
                    replace => 'true',
                    owner   => 'root',
                    group   => 'root',
                    mode    => '0600',
                    content => template("vpn/connection.db.usw2-app.erb");

                "/etc/ipsec.d/${usw2_service_db_name}":
                    ensure  => file,
                    replace => 'true',
                    owner   => 'root',
                    group   => 'root',
                    mode    => '0600',
                    content => template("vpn/connection.service.usw2-db.erb");

                "/etc/ipsec.d/${ase1_db_app_name}":
                    ensure  => file,
                    replace => 'true',
                    owner   => 'root',
                    group   => 'root',
                    mode    => '0600',
                    content => template("vpn/connection.db.ase1-app.erb"); 
            }
        }
    }else{
        file{  
            "/etc/ipsec.d/${use1_service_origin_name}":
                ensure  => file,
                replace => 'true',
                owner   => 'root',
                group   => 'root',
                mode    => '0600',
                content => template("vpn/connection.service.use1.erb"); 

            "/etc/ipsec.d/${use1_db_origin_name}":
                ensure  => file,
                replace => 'true',
                owner   => 'root',
                group   => 'root',
                mode    => '0600',
                content => template("vpn/connection.db.use1.erb"); 
        }
    }
}