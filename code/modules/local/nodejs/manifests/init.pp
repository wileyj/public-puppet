class nodejs {
    class { 'nodejs::packages': } ->
    class { 'nodejs::modules': } ->
    class { 'nodejs::templates': }
}