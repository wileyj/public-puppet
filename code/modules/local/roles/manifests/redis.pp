class roles::redis {
    $dbname = $server_role
    class { "profiles::${dbname}": }
}
