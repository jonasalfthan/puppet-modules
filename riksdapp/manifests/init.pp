class riksdapp(
$projectname = 'riksdapp',
$first_time_setup= 'true', 
$serverName = 'riksdapp-app') {


  if versioncmp($::puppetversion,'3.6.1') >= 0 {

    $allow_virtual_packages = hiera('allow_virtual_packages',false)

    Package {
      allow_virtual => $allow_virtual_packages,
    }
  }

  class{'riksdapp::users':
        projectname => $projectname,
 	serverName => $serverName 
  }
  
  class{'riksdapp::git':
	projectname => $projectname,
	first_time_setup => $first_time_setup, 
  }
  
  class{'riksdapp::apache':
        projectname => $projectname,
        serverName => $serverName
  }

}





include riksdapp
