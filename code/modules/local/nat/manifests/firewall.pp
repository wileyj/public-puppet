class nat::firewall( 
    $iptables = hiera('nat::firewall::rules',[]),                    
){
    create_resources('firewall',$iptables)
}
