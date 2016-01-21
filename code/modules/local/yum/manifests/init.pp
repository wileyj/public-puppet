class yum {
    class {'yum::files': }->
    class {'yum::packages': }->
    class {'yum::sumo': }
}
