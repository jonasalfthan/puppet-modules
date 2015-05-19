class independentspirits(
$projectname = 'independentspirits',
$first_time_setup= 'true', 
$serverName = 'independentspirits.se') {


  if versioncmp($::puppetversion,'3.6.1') >= 0 {

    $allow_virtual_packages = hiera('allow_virtual_packages',false)

    Package {
      allow_virtual => $allow_virtual_packages,
    }
  }

  class{'independentspirits::users':
        projectname => $projectname,
 	serverName => $serverName 
  }
  
  class{'independentspirits::git':
	projectname => $projectname,
	first_time_setup => $first_time_setup, 
  }
  
  class{'independentspirits::apache':
        projectname => $projectname,
        serverName => $serverName
  }

  class{'independentspirits::application':
        projectname => $projectname,
        serverName => $serverName
  }
 #class{'independentspirits::webdev':
  #      projectname => $projectname,
  #      serverName => $serverName
  #}
}





#include independentspirits
