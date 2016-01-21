require 'facter'
Facter.add("brokenuser") do
    confine :kernel => :linux
    setcode do
        output = %x{grep -c luser /etc/passwd}.chomp
        if output.length > 0
            output.chomp
        else
            output="Undefined"
            output
        end
    end
end

Facter.add("users_with_cronjobs") do
    confine :kernel => :linux
    setcode do
        filenum=%x{ls /var/spool/cron | wc -l}
        if /^0/.match(filenum)
            output = %x{/usr/bin/find /var/spool/cron -type f -exec /bin/basename \{\} \\;|/bin/sort}.split("\n").join(",")
            if output.length > 0
                output.chomp
            else
                output="Undefined"
                output
            end
        else
            output="nil"
            output
        end
    end
end

Facter.add("logins") do
    setcode do
        %x{/usr/bin/who |wc -l}.chomp
    end
end

