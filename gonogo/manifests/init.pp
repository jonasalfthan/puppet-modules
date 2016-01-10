class gonogo(
$projectname = 'gonogo',
$first_time_setup= 'true', 
$serverName = 'gonogo-app') {


  if versioncmp($::puppetversion,'3.6.1') >= 0 {

    $allow_virtual_packages = hiera('allow_virtual_packages',false)

    Package {
      allow_virtual => $allow_virtual_packages,
    }
  }

  class{'gonogo::users':
        projectname => $projectname,
 	serverName => $serverName 
  }
  
  class{'gonogo::git':
	projectname => $projectname,
	first_time_setup => $first_time_setup, 
  }
  
  class{'gonogo::apache':
        projectname => $projectname,
        serverName => $serverName
  }

  class{'gonogo::application':
        projectname => $projectname,
        serverName => $serverName
  }
}





#include gonogo
