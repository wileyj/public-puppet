class subversion::repos {
    exec { 
        "Delete svn-assets lost+found":
            command => "/bin/rm -rf /repos/svn-assets/lost+found/",
            onlyif  => "/usr/bin/test -d /repos/svn-assets/lost+found/";

        "Delete unity-slot-assets lost+found":
            command => "/bin/rm -rf /repos/unity-slot-assets/lost+found/",
            onlyif  => "/usr/bin/test -d /repos/unity-slot-assets/lost+found/";

        "Delete ops lost+found":
            command => "/bin/rm -rf /repos/ops/lost+found/",
            onlyif  => "/usr/bin/test -d /repos/ops/lost+found/";
    } ->
    exec {
        "Create svn-assets repo":
            command => "/usr/bin/svnadmin create /repos/svn-assets",
            creates => "/repos/svn-assets/format",
            require => Package["subversion"];

        "Create unity-slot-assets repo":
            command => "/usr/bin/svnadmin create /repos/unity-slot-assets",
            creates => "/repos/unity-slot-assets/format",
            require => Package["subversion"];

        "Create ops repo":
            command => "/usr/bin/svnadmin create /repos/ops",
            creates => "/repos/ops/format",
            require => Package["subversion"];

        "fix permissions for /repos/svn-assets":
            command => "/bin/chown root:svnusers /repos/svn-assets";

        "fix permissions for /repos/unity-slot-assets":
            command => "/bin/chown root:svnusers /repos/unity-slot-assets";

        "fix permissions for /repos/ops":
            command => "/bin/chown root:svnusers /repos/ops"
    }
}