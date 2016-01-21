 class bastion::templates(
    $files     = hiera('bastion::files', {}),
    $gopath    = hiera('env::gopath'),
    $facterlib = hiera('env::facterlib'),
    $path      = hiera('env::path'),
){
    create_resources('file',$files)
} 
