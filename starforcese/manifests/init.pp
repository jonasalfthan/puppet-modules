class anttiproject(
$projectname = 'startuple',
$first_time_setup= 'true', 
$serverName = 'startuple.net') {


  if versioncmp($::puppetversion,'3.6.1') >= 0 {

    $allow_virtual_packages = hiera('allow_virtual_packages',false)

    Package {
      allow_virtual => $allow_virtual_packages,
    }
  }

  class{'anttiproject::users':
        projectname => $projectname,
 	serverName => $serverName 
  }
  
  class{'anttiproject::git':
	projectname => $projectname,
	first_time_setup => $first_time_setup, 
  }
  
  class{'anttiproject::apache':
        projectname => $projectname,
        serverName => $serverName
  }

  class{'anttiproject::application':
        projectname => $projectname,
        serverName => $serverName
  }
 #class{'anttiproject::webdev':
  #      projectname => $projectname,
  #      serverName => $serverName
  #}
}





#include anttiproject
