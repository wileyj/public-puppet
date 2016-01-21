require 'facter'
Facter.add("interfaces") do
    confine :kernel => Facter::Util::IP.supported_platforms
    setcode do
        Facter::Util::IP.get_interfaces.collect { |iface| Facter::Util::IP.alphafy(iface) }.join(",")
    end
end

Facter.add("local_mounts") do
    confine :kernel => :linux
    output = %x{/bin/grep -v ^# /etc/fstab|/bin/grep -v '^$\\|swap\\|pts\\|tmpfs\\|proc\\|sysfs\\|nfs\\|davfs'|/bin/awk {'print $2'}|/bin/sort}.split("\n").join(",").chomp
    setcode do
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end

Facter.add("mountlist") do
    confine :kernel => :linux
    setcode do
        output = []
        writable = "false"
        #a = %x{/bin/grep -v ^# /etc/fstab|/bin/grep -v '^$\\|swap\\|pts\\|tmpfs\\|proc\\|sysfs\\|davfs'|grep nfs}.gsub(/,/,':').collect { |i| i.sub(/\n$/,'') }
        #a = %x{/bin/grep -v ^# /etc/fstab|/bin/grep -v '^$\\|swap\\|pts\\|tmpfs\\|proc\\|sysfs\\|davfs'|grep nfs |/bin/awk {'print $2'}|/bin/sort}.split("\n").join(",")
        a = %x{/bin/grep -v ^# /etc/fstab|/bin/grep -v '^$\\|swap\\|pts\\|tmpfs\\|proc\\|sysfs\\|davfs'|grep nfs}
        a.each_line do |line|
            device,mount,type,options = line.split("\t")
            options.split(':').each do |opt|
                if opt =~ /\A(ro|rw)/
                    writable = case opt
                        when "ro" then "false"
                        when "rw" then "true"
                    end
                    break
                end
            end
            output << "#{mount},#{device},#{writable}"
        end
        output.join("#")
    end
end
