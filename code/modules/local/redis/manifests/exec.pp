class redis::exec {
    exec {
        "/bin/echo never > /sys/kernel/mm/transparent_hugepage/enabled":
            path    => "/usr/bin:/usr/sbin:/bin",
            unless  => "grep '[never]' /sys/kernel/mm/transparent_hugepage/enabled 2>/dev/null",
            onlyif => '/usr/bin/test -f /sys/kernel/mm/transparent_hugepage/enabled';

        "/bin/echo '00000000,00000003' > /sys/class/net/eth0/queues/rx-0/rps_cpus":
            path    => "/usr/bin:/usr/sbin:/bin",
            unless  => "grep '3' /sys/class/net/eth0/queues/rx-0/rps_cpus 2>/dev/null",
            onlyif => '/usr/bin/test -f /sys/class/net/eth0/queues/rx-0/rps_cpus';
    } 
}