class jenkins::templates(
    $files = hiera('jenkins::files', {}),
){
    create_resources('file',$files)
}