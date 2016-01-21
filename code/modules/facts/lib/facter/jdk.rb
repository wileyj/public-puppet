require 'facter'
Facter.add("jdk_version") do
    setcode do
        out = %x{/bin/rpm -qva | grep jdk | grep -v ldap | /bin/cut -d- -f2 | sort}
        output = out.split("\n").last.chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end
