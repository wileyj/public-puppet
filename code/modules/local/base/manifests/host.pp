class base::host{
    if !("" in [$host_packages]) {
        package {
            $host_packages:
                ensure  => installed;
        }   
    } ->
    if !("" in [$host_files]) {
        create_resources('file',$host_files)
    } ->
    if !("" in [$host_python_modules]) {
        package {
            $host_python_modules:
                require => Package["python27-pip"],
                ensure  => latest,
                provider => pip;
        }
    } ->
    if !("" in [$host_nodejs_modules]) {
        package {
            $host_nodejs_modules:
                require => Package["nodejs-npm"],
                provider => npm;
        }
    } ->
    if !("" in [$host_golang_modules]) {
        package {
            $host_golang_modules:
                require => Package["golang"],
                ensure  => latest,
                provider => npm;
        }
    } ->
    if !("" in [$host_users]) {
        create_resources(user, $host_users)
    } ->
    if !("" in [$host_groups]) {
        create_resources(user, $host_groups)
    } ->
    if !("" in [$host_keys]) {
        create_resources('file', $host_keys)
    } ->
    if !("" in [$host_sysctl]) {
        create_resources(sysctl::value,$host_sysctl)
    } ->
    if !("" in [$host_sudo]) {
        create_resources(sudo::conf,$host_sudo)
    } ->
    if !("" in [$host_cron]) {
        create_resources(cron::job,$host_cron)
    } ->
    if !("" in [$host_iptables]) {
        create_resources(firewall,$host_iptables)
    } ->
    if !("" in [$host_services]) {
        service {
            $host_services:
                enable => true,
                ensure => running,
                path => '/etc/init.d'
        }
    }
}
