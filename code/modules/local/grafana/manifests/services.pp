class grafana::services(
    $services = hiera('grafana::services',[]),
){
    # service {
    #     $services:
    #         enable => true,
    #         ensure => running,
    #         path => '/etc/init.d';
    # }
}