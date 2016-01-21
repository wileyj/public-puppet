class bastion::scripts inherits bastion::params {
    #file {
    #   "/usr/bin/syncpasswd":
    #       owner   => root,
    #       group   => root,
    #       source  => "puppet:///modules/bastion/syncpasswd/syncpasswd",
    #       replace => "true",
    #       require => Package["perl-LDAP"],
    #       ensure  => "present",
    #       mode    => 755;
    # 
    #   "/etc/mapped":
    #       owner   => root,
    #       group   => root,
    #       source  => "puppet:///modules/bastion/syncpasswd/mapped",
    #       replace => "true",
    #       ensure  => "present",
    #       mode    => 644;
    # 
    #   "/etc/cron.d/syncpasswd.cron":
    #       owner   => root,
    #       group   => root,
    #       source  => "puppet:///modules/bastion/syncpasswd/syncpasswd.cron",
    #       require => File["/usr/bin/syncpasswd"],
    #       ensure  => "present",
    #       mode    => 644;
  	#}
}
