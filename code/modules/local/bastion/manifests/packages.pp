class bastion::packages inherits bastion::params {
    # notify{" THIS IS bastion PACKAGES ": } ->
    package {
        $packages:
            ensure  => latest;
    } 
    #} -> 
    # notify{" Removing Amazon openssh packages ": } ->
    # exec{
    #   'remove_amazon_openssh':
    #         command => '/bin/rpm -e --nodeps openssh-6.2p2-8.43.amzn1.x86_64',
    #         onlyif  => '/bin/rpm -qa 2>&1|grep -q openssh-6.2p2-8.43.amzn1';

    #     'remove_regular_openssh_server':
    #         command => '/bin/rpm -e --nodeps openssh-clients-6.2p2-8.43.amzn1.x86_64',
    #         onlyif  =>  '/bin/rpm -qa  2>&1|grep openssh-clients-6.2p2-8.43.amzn1';

    #     'remove_regular_openssh_clients':
    #         command => '/bin/rpm -e --nodeps openssh-server-6.2p2-8.43.amzn1.x86_64',
    #         onlyif  =>  '/bin/rpm -qa  2>&1|grep openssh-server-6.2p2-8.43.amzn1';

    #     'remove_regular_zsh':
    #         command => '/bin/rpm -e --nodeps zsh-4.3.10-8.9.amzn1.x86_64',
    #         onlyif  =>  '/bin/rpm -qa  2>&1|grep zsh-4.3.10-8.9.amzn1';
    # } 
    # notify{ " Installing ssh packages ": } ->
    # package {
    #     $ssh_packages:
    #         ensure => 'latest';
    # }
}

