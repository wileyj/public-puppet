class base::dev_users(
    $dev_users = hiera('dev::users',{}),
    $dev_group = hiera('dev::groups',{}),
    $dev_keys  = hiera('dev::keys',{}),
) {
    create_resources(group, $dev_group)
    create_resources(user, $dev_users)
    create_resources('file', $dev_keys)
}