class anttiproject::users(
$projectname = 'anttiproject',
$serverName = '') {

  group { $projectname :
        ensure => present,
        gid    => 1000
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
}


#include anttiproject::users
