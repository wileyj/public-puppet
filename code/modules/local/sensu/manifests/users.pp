class sensu::users (
    $users = hiera('sensu::users', {}),
    $groups = hiera('sensu::groups', {}),
){
    create_resources(group, $groups)
    create_resources(user, $users)
} 
