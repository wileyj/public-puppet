class resources {
    include ::sysctl
    include ::cron
    include ::sudo
    include ::types
    $defaults = hiera_hash('resources::defaults', {})
    $items = hiera_hash('resources::items', {})
    $resource_types = hiera('resources::resource_types');
    each($resource_types) |$type| {
        if (is_hash($defaults[$type])) {
            $default_hash = $defaults[$type]
        } else {
            $default_hash = {}
        }
        if (is_hash($items[$type])) {
            $count = count($items[$type])
            notice("Creating ${count} resources of type ${type}")
            create_resources($type, $items[$type], $default_hash)
        }
    }
}
