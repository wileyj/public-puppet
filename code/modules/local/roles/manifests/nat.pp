class roles::nat {
    class { 'profiles::vpn': }
    class { 'profiles::nat': }
}
