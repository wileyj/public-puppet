class ssh::templates (
    $root_allowed     = hiera('ssh::config::root_allowed'),
    $password_allowed = hiera('ssh::config::password_allowed'),          
){
    file {
        '/etc/ssh/sshd_config':
            owner   => root,
            group   => root,
            mode    => "0644",
            content => template("ssh/sshd_config.erb"),
            require => Package["openssh-server"];
    } 
}
