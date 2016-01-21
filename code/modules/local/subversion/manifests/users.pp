class subversion::users(
    $users  = hiera('subversion::users',{}),
    $groups = hiera('subversion::groups',{}),
    $keys   = hiera('subversion::keys',{}),
){
    create_resources(group, $groups)
    create_resources(user, $users)
    create_resources('file', $keys)
}