# ssh.pp
class bastion::ssh inherits ssh::install {
    file { 
        '/etc/ssh/sshd_config':
            owner   => 'root',
            group   => 'root',
            source  => "puppet:///modules/bastion/etc/ssh/sshd_config",
            replace => "true",
            mode    => '644',
            require => Package["openssh-server"];

        '/etc/pam.d/sshd':
            owner   => 'root',
            group   => 'root',
            source  => "puppet:///modules/bastion/etc/pam.d/sshd",
            replace => "true",
            mode    => '644',
            require => Package["openssh-server"];
    }
    # } ->
    # service { 
    #     'sshd':
    #         ensure    => running,
    #         enable    => true,
    #         hasstatus => true,
    #         require   => Package["openssh-server"],
    #         subscribe => File["/etc/ssh/sshd_config"];
   	# }
} 
