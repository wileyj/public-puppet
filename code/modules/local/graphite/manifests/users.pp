class graphite::users( 
    $users  = hiera('graphite::users',{}),
    $groups = hiera('graphite::groups',{}),
){
    create_resources(group, $groups)
    create_resources(user, $users)
}