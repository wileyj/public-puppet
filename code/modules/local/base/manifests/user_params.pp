class base::user_params{
    $admin_users               = hiera('admin::users',{})
    $admin_group               = hiera('admin::groups',{})
    $admin_keys                = hiera('admin::keys',{})
    $dev_users                 = hiera('dev::users',{})
    $dev_group                 = hiera('dev::groups',{})
    $dev_keys                  = hiera('dev::keys',{})
    $analytics_users           = hiera('analytics::users',{})
    $analytics_group           = hiera('analytics::groups',{})
    $analytics_keys            = hiera('analytics::keys',{})
}
