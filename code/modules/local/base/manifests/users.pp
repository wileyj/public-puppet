class base::users(
    $admin_users               = hiera('admin::users',{}),
    $admin_group               = hiera('admin::groups',{}),
    $admin_keys                = hiera('admin::keys',{}),
){
    create_resources(group, $admin_group)
    create_resources(user, $admin_users)
    create_resources('file', $admin_keys)
}