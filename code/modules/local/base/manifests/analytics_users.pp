class base::analytics_users(
    $analytics_users = hiera('analytics::users',{}),
    $analytics_group = hiera('analytics::groups',{}),
    $analytics_keys  = hiera('analytics::keys',{}),
){
    create_resources(group, $analytics_group)
    create_resources(user, $analytics_users)
    create_resources('file', $analytics_keys)
}