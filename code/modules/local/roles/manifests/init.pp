class roles{
    #class { "profiles::${server_role}": }
    #if defined( "profiles::${server_role}" ) {
    if defined( "roles::${server_role}" ) {
        #class { "profiles::${server_role}": }
        class { "roles::${server_role}": }
    }
}
