class base::sudo(
    $sudo  = hiera('common::sudo',{}),
){
    create_resources(sudo::conf,$sudo)
}