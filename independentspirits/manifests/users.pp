class independentspirits::users(
$projectname = 'independentspirits',
$serverName = '') {

  group { $projectname :
        ensure => present,
  }
  user { "antti":
        ensure     => present,
	password   => "antti",
        managehome => true,
        groups     => [$projectname],
        gid        => $projectname,
	membership => minimum,
        shell      => "/bin/bash",
        require    => Group[$projectname]
  }
  user { "jonas":
        ensure     => present,
        managehome => true,
        groups     => [$projectname],
        membership => minimum,
        shell      => "/bin/bash",
        require    => Group[$projectname]
  }
  user { "git":
        ensure     => present,
        managehome => true,
        groups     => [$projectname],
        membership => minimum,
        shell      => "/bin/bash",
        require    => Group[$projectname]
  }

}


#include independentspirits::users
