class subversion::templates(
    $files  = hiera('subversion::files',{}),
){
    create_resources('file',$files)
}