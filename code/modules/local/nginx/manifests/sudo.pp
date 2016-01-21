class nginx::sudo(
    $sudo = hiera('nginx::sudo', {}),
){
    create_resources(sudo::conf,$sudo)
}
