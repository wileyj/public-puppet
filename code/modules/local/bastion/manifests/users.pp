class bastion::users inherits bastion::user_params {

    # notify{" Creating Admin Group/Users" : }
    # create_resources(group, $admin_group)
    # create_resources(user, $admin_users)
    # create_resources('file', $admin_keys)

    # notify{" Creating Dev Group/Users" : }
    create_resources(group, $dev_group)
    create_resources(user, $dev_users)
    create_resources('file', $dev_keys)

    # notify{" Creating Analytics Group/Users" : }
    create_resources(group, $analytics_group)
    create_resources(user, $analytics_users)
    create_resources('file', $analytics_keys)

    # notify{" Creating Celery Group/Users" : }
    #create_resources(group, $celery_group)
    #create_resources(user, $celery_users)
    #create_resources('file', $celery_keys)

    # notify{" Creating Jail Group" : }
    create_resources(group, $jail_group)
}
