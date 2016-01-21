class yum::packages {
    package {
        yum: 
            ensure => latest;
    }
}
