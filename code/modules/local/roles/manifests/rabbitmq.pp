class roles::rabbitmq(
    $rabbitmq_files  = hiera('rabbitmq::files', {}),
    # $rabbit_packages = hiera('rabbitmq::packages',[]),
    # $rabbit_services = hiera('rabbitmq::services',[]),
) {
    create_resources('file',$rabbitmq_files)
    class{'profiles::rabbitmq' : }
    # notify{" Configuring Sensu Rabbitmq $rabbit_packages " : }
    # package {
    #     $rabbit_packages:
    #         ensure  => latest;
    # }
}
