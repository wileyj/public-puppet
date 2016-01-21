require 'facter'
Facter.add("kernel_version") do
    output = ""
    setcode do
        output = Facter.value(:kernelversion)
        if output.length > 0
            output.chomp
        else
            output="Undefined"
            output
        end
    end
end

Facter.add("kernel_release") do
    output = ""
    setcode do
        output = %x{/bin/uname -r}.chomp
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end