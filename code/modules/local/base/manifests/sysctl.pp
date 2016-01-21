class base::sysctl( 
    $sysctl_values = hiera('sysctl::base::values',{}),
){
    create_resources(sysctl::value,$sysctl_values)
}
