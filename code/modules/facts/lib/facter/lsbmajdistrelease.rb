require 'facter'
Facter.add("lsbmajdistrelease") do
    setcode do
        output = Facter.value(:operatingsystemmajrelease)
        if output.length > 0
            output.chomp
        else
            output="Undefined"
            output
        end
    end
end
