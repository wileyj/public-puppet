class redis::templates (
    $files = hiera('redis::files', {}),
){
    create_resources('file',$files)
}
