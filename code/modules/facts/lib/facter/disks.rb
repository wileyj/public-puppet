require 'facter'
Facter.add("vgsize") do
    setcode do
        system("grep mapper /proc/mounts > /dev/null 2>&1")
        returned = $?.exitstatus 
        if returned != 0
            output = "Undefined"
            output
        else
            output = %x{/sbin/vgs --noheadings | awk '{print $6}'}.chomp
            if output.length > 0
                output
            else
                output="Undefined"
                output
            end
        end
    end
end
