require 'facter'

Facter.add("lowercase_os") do
    setcode do
        output = Facter.value(:operatingsystem).downcase
        if output.length > 0
            output
        else
            output="Undefined"
            output
        end
    end
end
