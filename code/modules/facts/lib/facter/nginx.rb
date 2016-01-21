require 'facter'
if FileTest.exist?("/etc/init.d/nginx")
    Facter.add("nginx_site_list") do
        setcode do
            output = %x{ls /etc/nginx/sites-enabled}.split("\n").join(" ").chomp
            if output.length > 0
                output
            else
                output="Undefined"
                output
            end
        end
    end

    Facter.add("nginx_version") do
        setcode do
            output = %x{/bin/rpm -qva nginx|/bin/cut -d- -f2}.chomp
            if output.length > 0
                output
            else
                output="Undefined"
                output
            end
        end
    end
end
