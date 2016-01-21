class services (
    $disabled = [],
    $enabled = []
) {
    service {
        $disabled:
            ensure => stopped,
            enable => false;
        $enabled:
            ensure => running,
            enable => true;
    }
}

