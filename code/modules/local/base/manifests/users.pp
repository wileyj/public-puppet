class base::users(
    $admin_users               = hiera('admin::users',{}),
    $admin_group               = hiera('admin::groups',{}),
    $admin_keys                = hiera('admin::keys',{}),
    $dev_users                 = hiera('dev::users',{}),
    $dev_group                 = hiera('dev::groups',{}),
    $dev_keys                  = hiera('dev::keys',{}),
    $analytics_users           = hiera('analytics::users',{}),
    $analytics_group           = hiera('analytics::groups',{}),
    $analytics_keys            = hiera('analytics::keys',{}),
){
    create_resources(group, $admin_group)
    create_resources(user, $admin_users)
    create_resources('file', $admin_keys)

    # notify{" Creating Dev Group/Users" : }
    # create_resources(group, $dev_group)
    # create_resources(user, $dev_users)
    # create_resources('file', $dev_keys)

    # notify{" Creating Analytics Group/Users" : }
    # create_resources(group, $analytics_group)
    # create_resources(user, $analytics_users)
    # create_resources('file', $analytics_keys)

}