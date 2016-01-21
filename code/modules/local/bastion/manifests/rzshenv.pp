class bastion::rzshenv inherits bastion::params {
  	exec { 
        "setup_chroot_libraries" :
            command         => "/usr/bin/perl /opt/scripts/chroot_setup.pl",
            refreshonly     => true,
            subscribe       => File["/opt/scripts/chroot_setup.pl"],
            unless          => "/usr/bin/test -f /etc/sysconfig/chroot_setup";
    }
}
