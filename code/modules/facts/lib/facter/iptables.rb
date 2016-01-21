require 'facter'
Facter.add("iptables_save_cmd") do
    setcode do
        output = "/sbin/iptables-save"
        if output.length > 0
            output.chomp
        else
            output="Undefined"
            output
        end
    end
end

if File::exist?("/sbin/iptables")
    Facter.add("iptables_cmd") do
        setcode do
            if File::exist?("/etc/init.d/iptables")
                output = "/sbin/iptables"
            else
                output = "/bin/false"
            end
            if output.length > 0
                output
            else
                output="Undefined"
                output
            end
        end
    end

    Facter.add("iptables_version") do
        setcode do
            if File::exist?("/sbin/iptables")
                ipt_cmd = Facter.value(:iptables_cmd)
                output = %x{#{ipt_cmd} --version}.scan(/ v([0-9\.]+)/)[0][0].chomp
                if output.length > 0
                    output
                else
                    output="Undefined"
                    output
                end
            end
        end
    end

    Facter.add("iptables_persist_cmd") do
        setcode do
            case Facter.value(:operatingsystem).downcase
                when "fedora", "redhat", "centos"
                    then "/sbin/service iptables save"
                when "ubuntu", "debian"
                    then "/etc/init.d/iptables-persistent save"
                when "gentoo"
                    then "/etc/init.d/iptables save"
                else nil
            end
        end
    end

    Facter.add("iptables_version") do
        setcode do
            if File::exist?("/sbin/iptables")
                ipt_cmd = Facter.value(:iptables_cmd)
                output = %x{#{ipt_cmd} --version}.scan(/ v([0-9\.]+)/)[0][0].chomp
                if output.length > 0
                    output
                else
                    output="Undefined"
                    output
                end
            end
        end
    end
    
    Facter.add("iptables_ipcidr") do
        setcode do
            iptablesversion = Facter.value(:iptables_version)
            iptablesversion = iptablesversion.split(".")
            if iptablesversion[0].to_i < 2 and iptablesversion[1].to_i < 4
                false
            else
                true
            end
        end
    end
end
