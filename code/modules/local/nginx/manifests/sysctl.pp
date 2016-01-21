class nginx::sysctl(
    $sysctl = hiera('nginx::sysctl', {}),
){
    create_resources(sysctl::value,$sysctl)
}
