class postgres::users(
    $users  = hiera('postgres::users',{}),
    $groups = hiera('postgres::groups',{}),
){
    create_resources(group, $groups)
    create_resources(user, $users)
}