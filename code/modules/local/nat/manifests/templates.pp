class nat::templates(
    $files = hiera('nat::files', [])
){
    create_resources('file',$files)
    file_line{
        "update rc.local (configure-pat.sh)":
            path => "/etc/rc.d/rc.local",
            line => '/usr/local/sbin/configure-pat.sh',
    }
}
