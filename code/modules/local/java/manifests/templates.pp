class java::templates (
    $files = hiera('java::files', {})
){
    create_resources('file', $files)
}
