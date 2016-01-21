class jenkins::users(
    $users = hiera('jenkins::users',{}),
    $group = hiera('jenkins::groups',{}),
    $keys  = hiera('jenkins::keys',{}),
){
    create_resources(group, $group)
    create_resources(user, $users)
    create_resources('file', $keys)
}