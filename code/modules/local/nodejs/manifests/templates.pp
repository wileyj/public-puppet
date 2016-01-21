class nodejs::templates(
    $files = hiera('nodejs::files', {}),
){
    create_resources('file',$files)
}