class uchiwa::sudo(
    $sudo  = hiera('uchiwa::sudo::conf', {}),
) {
    create_resources('sudo::conf',$sudo)
}