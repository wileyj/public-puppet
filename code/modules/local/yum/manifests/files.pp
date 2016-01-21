class yum::files  {
    file {
        "/etc/yum.conf":
            owner   => 'root',
            group   => 'root',
            mode    => '644',
            source  => "puppet:///modules/yum/etc/yum.conf";

        "/etc/yum.repos.d/CentOS-Base.repo": 
            ensure => absent;
            
        "/etc/yum.repos.d/CentOS-Debuginfo.repo": 
            ensure => absent;
            
        "/etc/yum.repos.d/CentOS-Media.repo": 
            ensure => absent;
            
        "/etc/yum.repos.d/CentOS-Vault.repo": 
            ensure => absent;
            
        "/etc/yum.repos.d/centos.repo": 
            ensure => absent;
            
        "/etc/yum.repos.d/epel-fake.repo": 
            ensure => absent;
            
        "/etc/yum.repos.d/epel-testing.repo": 
            ensure => absent;
            
        "/etc/yum.repos.d/epel-debuginfo.repo": 
            ensure => absent;
    }
}
