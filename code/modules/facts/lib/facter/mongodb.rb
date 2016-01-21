require 'facter'
Facter.add("mongodb_version") do
    confine :server_role => :mongodb
    setcode do
        output = %x{/bin/rpm -qva mongodb|/bin/cut -d- -f2}.chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end

if FileTest.exist?("/etc/init.d/mongodb")
    Facter.add("mongodb_instance_list") do
        confine :server_role => :mongodb
        setcode do
            output = %x{/etc/init.d/mongodb status|/bin/grep running|/bin/awk {'print $3'}}.collect { |i| i.sub(/\n$/,'') }.uniq.join(",").gsub!(/\[/,'').gsub!(/\]/,'').chomp
            if output.length > 0
                output
            else
                output="Undefined"
                output
            end
        end
    end
    if FileTest.directory?("/opt/mongodb/instance")
        Facter.add("mongodb_diskfree") do
            confine :server_role => :mongodb
            setcode do
                r = Hash.new()
                %x{/bin/df -PTl | /bin/grep /opt/mysql/mongodb}.each do |m|
                    md = m.split()
                    r[md[6]] = "\"used\" : #{md[2]}, \"available\" : #{md[3]}, \"capacity\" : #{md[4]}"
                end
                output = '{ ' + r.map{|k,v| "\"#{k}\" : { #{v} }"}.join(', ') + ' }'
                if output.length > 0
                    output.chomp
                else
                    output="Undefined"
                    output
                end
            end
        end
    end
end
