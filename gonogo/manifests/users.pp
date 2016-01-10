class gonogo::users(
$projectname = 'gonogo',
$serverName = '') {

  group { $projectname :
        ensure => present,
  }
  user { "jonas":
        ensure     => present,
	password   => "antti",
        managehome => true,
        groups     => [$projectname],
        gid        => $projectname,
	membership => minimum,
        shell      => "/bin/bash",
        require    => Group[$projectname]
  }
  user { "jonatan":
        ensure     => present,
        managehome => true,
        groups     => [$projectname],
        membership => minimum,
        shell      => "/bin/bash",
        require    => Group[$projectname]
  }
  user { "robin":
        ensure     => present,
        managehome => true,
        groups     => [$projectname],
        membership => minimum,
        shell      => "/bin/bash",
        require    => Group[$projectname]
  }
  user { "patrik":
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


include gonogo::users
