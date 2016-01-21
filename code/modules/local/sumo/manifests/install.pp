class sumo::install(
    $download_url        = hiera('sumo::params::download_url'),
    $install_dir         = hiera('sumo::params::install_dir'),
    $install_script      = hiera('sumo::params::install_script'),
    $install_script_dir  = hiera('sumo::params::install_script_dir'),
){
    if $install_script     { validate_string($install_script)            }
    if $install_dir        { validate_absolute_path($install_dir)        }
    if $install_script_dir { validate_absolute_path($install_script_dir) }
    exec { 
        'Get sumo_install.sh':
            command => "/usr/bin/curl -o ${install_script_dir}/${install_script} ${download_url}",
            path    => [ '/usr/bin', '/usr/local/bin' ],
            require => File[ '/etc/sumo.d'],
            creates => "${install_script_dir}/${install_script}";

        'Run sumo_install.sh':
            command => "/bin/sh ${install_script_dir}/${install_script} -q -dir \"${install_dir}\"",
            creates => $install_dir,
            path    => [ '/usr/local/sbin', '/usr/local/bin', '/usr/sbin', '/usr/bin', '/sbin', '/bin' ],
            require => Exec['Get sumo_install.sh'];
    }
}
