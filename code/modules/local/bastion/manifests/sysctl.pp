class bastion::sysctl( 
    $sysctl_values = hiera('sysctl::bastion::values',{}),
){
    create_resources(sysctl::value,$sysctl_values)
}
