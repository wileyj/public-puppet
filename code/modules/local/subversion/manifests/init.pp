class subversion {
    class { 'subversion::templates': }
    class { 'subversion::users': }
    class { 'subversion::packages': }
    class { 'subversion::repos': }
    class { 'subversion::services': }  
    class { 'subversion::sumo': }  
}