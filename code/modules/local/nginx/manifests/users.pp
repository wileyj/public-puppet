class nginx::users (
    $users = hiera('nginx::users',[]),
    $groups = hiera('nginx::groups',[]),
){
    create_resources(group, $groups)
    create_resources(user, $users)
}
