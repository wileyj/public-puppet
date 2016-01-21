class postgres::firewall {
    create_resources('firewall',$postgres_iptables)
}
