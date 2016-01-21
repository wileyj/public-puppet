class ssh::services (
    $services = hiera('ssh::services'),
){
    service {
        'sshd':
            ensure    => running,
            enable    => true,
            hasstatus => true,
            require   => Package["openssh-server"],
            subscribe => File["/etc/ssh/sshd_config"];
    }
}
