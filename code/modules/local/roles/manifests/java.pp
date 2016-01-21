class roles::java{
    class { 'profiles::nginx': } ->
    class { 'profiles::%{server_role}':  } 
}
