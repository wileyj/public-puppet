class nginx::templates(
    $files = hiera('nginx::files', {}),
    $nginx_configs = hiera('nginx::configs', {}),               
){
    create_resources('file',$files)
    create_resources('file',$nginx_configs)
}
