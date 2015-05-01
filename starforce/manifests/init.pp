class starforce(
$projectname = 'starforce',
$first_time_setup= 'true', 
$serverName = 'starforce.se') {


  if versioncmp($::puppetversion,'3.6.1') >= 0 {

    $allow_virtual_packages = hiera('allow_virtual_packages',false)

    Package {
      allow_virtual => $allow_virtual_packages,
    }
  }

  class{'starforce::users':
        projectname => $projectname,
 	serverName => $serverName 
  }
  
  class{'starforce::git':
	projectname => $projectname,
	first_time_setup => $first_time_setup, 
  }
  
  class{'starforce::apache':
        projectname => $projectname,
        serverName => $serverName
  }

  class{'starforce::application':
        projectname => $projectname,
        serverName => $serverName
  }
 #class{'starforce::webdev':
  #      projectname => $projectname,
  #      serverName => $serverName
  #}
}





#include starforce
