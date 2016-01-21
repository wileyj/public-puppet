class sumo::templates (
    $files              = hiera('sumo::files', {}),
    $access_id          = hiera('sumo::params::access_id'),
    $access_key         = hiera('sumo::params::access_key'),
    $clobber            = hiera('sumo::params::clobber'),
    # $collector_name     = hiera('sumo::params::collector_name'),
    $config_dir         = hiera('sumo::params::config_dir'),
    # $email              = hiera('sumo::params::email'),
    $ephemeral          = hiera('sumo::params::ephemeral'),
    $override           = hiera('sumo::params::override'),
    $password           = hiera('sumo::params::password'),
    # $proxy_host         = hiera('sumo::params::proxy_host'),
    # $proxy_ntlm_domain  = hiera('sumo::params::proxy_ntlm_domain'),
    # $proxy_password     = hiera('sumo::params::proxy_password'),
    # $proxy_port         = hiera('sumo::params::proxy_port'),
    # $sources_file       = hiera('sumo::params::sources_file'),
    $sync_sources       = hiera('sumo::params::sync_sources'),
){
    if $clobber            { validate_bool($clobber)                     }
    if $ephemeral          { validate_bool($ephemeral)                   }
    if $override           { validate_bool($override)                    }
    # if $proxy_host         { validate_string($proxy_host)                }
    # if $proxy_ntlm_domain  { validate_string($proxy_ntlm_domain)         }
    # if $proxy_password     { validate_string($proxy_password)            }
    # if $proxy_port         { validate_string($proxy_port)                }
    # if $email              { validate_string($email)                     }
    if $password           { validate_string($password)                  }
    # if $collector_name     { validate_string($collector_name)            }
    if $get_installer_cmd  { validate_string($get_installer_cmd)         }
    if $install_script     { validate_string($install_script)            }
    # if $sources_file       { validate_string($sources_file)              }
    if $access_id          { validate_string($access_id)                 }
    if $access_key         { validate_string($access_key)                }
    if $sync_sources       { validate_string($sync_sources)              }
    if $config_dir         { validate_absolute_path($config_dir)         }

    notify { "INIT Sumo templates" : } ->
    file{
        "/etc/sumo.conf":
            ensure  => present,
            replace => 'true',
            owner   => 'root',
            group   => 'root',
            mode    => '0600',
            require => File[ '/etc/sumo.d'],
            content => template("sumo/sumo.conf.erb");    
    }
}