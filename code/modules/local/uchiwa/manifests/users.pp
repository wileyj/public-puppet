class uchiwa::users (
    $users  = hiera('uchiwa::users',{})
){
    create_resources(user, $users)
} 