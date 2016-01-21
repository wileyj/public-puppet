class jenkins::sudo(
    $sudo = hiera('jenkins::sudo', {}),
){
    create_resources('sudo::conf',$sudo)
}