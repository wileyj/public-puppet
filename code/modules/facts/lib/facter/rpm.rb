require 'facter'
Facter.add("git_version") do
    confine :kernel => :linux
    setcode do
        output = %x{/bin/rpm -qva git|/bin/cut -d- -f2}.chomp
        if output.length > 0
            output
        else
            output="Not Installed"
            output
        end
    end
end

Facter.add("ruby_version") do
    confine :kernel => :linux
    setcode do
        output = %x{/bin/rpm -qva ruby|/bin/cut -d- -f2}.chomp
        if output.length > 0
            output
        else
            output="Not Installed"
            output
        end
    end
end

Facter.add("python_version") do
    confine :kernel => :linux
    setcode do
        output = %x{/bin/rpm -qva python|/bin/cut -d- -f2}.chomp
        if output.length > 0
            output
        else
            output="Not Installed"
            output
        end
    end
end

Facter.add("python27_version") do
    confine :kernel => :linux
    setcode do
        output = %x{/bin/rpm -qva python27|/bin/cut -d- -f2}.chomp
        if output.length > 0
            output
        else
            output="Not Installed"
            output
        end
    end
end

Facter.add("redis_version") do
    confine :kernel => :linux
    setcode do
        output = %x{/bin/rpm -qva redis |/bin/cut -d- -f2}.chomp
        if output.length > 0
            output
        else
            output="Not Installed"
            output
        end
    end
end

Facter.add("sensu_client") do
    confine :kernel => :linux
    setcode do
        output = %x{/bin/rpm -qva sensu-client|/bin/cut -d- -f3}.chomp
        if output.length > 0
            output
        else
            output="Not Installed"
            output
        end
    end
end

Facter.add("sensu_server") do
    confine :kernel => :linux
    confine :server_role => [:sensu]
    setcode do
        output = %x{/bin/rpm -qva sensu-server|/bin/cut -d- -f3}.chomp
        if output.length > 0
            output
        else
            output="Not Installed"
            output
        end
    end
end

Facter.add("nodejs") do
    confine :kernel => :linux
    setcode do
        output = %x{/bin/rpm -qva nodejs|/bin/cut -d- -f2}.chomp
        if output.length > 0
            output
        else
            output="Not Installed"
            output
        end
    end
end

Facter.add("postgres_version") do
    confine :kernel => :linux
    confine :server_role => :postgres
    setcode do
        output = %x{/bin/rpm -qa | grep postgres | grep server|/bin/cut -d- -f3}.chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end