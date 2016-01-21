require 'facter'
Facter.add("primary_int") do
    setcode do
        output = %x{/bin/netstat -ran |/bin/grep ^0.0.0.0 |/bin/awk '{print $NF; exit}'}.chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end

Facter.add("first_two_octets") do
    setcode do
        iface = %x{/bin/netstat -ran |/bin/grep ^0.0.0.0 |/bin/awk '{print $NF; exit}'}.chomp
        output = $1 if %x{/sbin/ifconfig #{iface}}  =~ /([0-9]+\.[0-9]+)(\.[0-9]+\.[0-9]+)/
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end
