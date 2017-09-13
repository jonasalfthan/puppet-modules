class riksdapp::users(
$projectname = 'riksdapp',
$serverName = '') {

  group { $projectname :
        ensure => present,
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


include riksdapp::users
