require 'facter'
data = Facter::Util::Resolution.exec('cat /proc/loadavg 2> /dev/null')
data = data.split(' ')
running_processes = data[3].split('/').first
total_processes   = data[3].split('/').last
    
Facter.add("load_average") do
    setcode { data[0,3].join(',') }
end

Facter.add("load_average_1") do
    setcode do
        output = data[0].chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end

Facter.add("load_average_5") do
    setcode do
        output = data[1].chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end

Facter.add("load_average_15") do
    setcode do
        output = data[2].chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end

Facter.add("running_processes") do
    setcode do
        output = running_processes
        if output.length > 0
            output.chomp
        else
            output="Undefined"
            output
        end
    end
end

Facter.add("total_processes") do
    setcode do
        output = total_processes
        if output.length > 0
            output.chomp
        else
            output="Undefined"
            output
        end
    end
end
Facter.add("last_pid") do
    setcode do
        output = data[4].chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end
