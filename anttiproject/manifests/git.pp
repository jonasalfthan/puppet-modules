class anttiproject::git(
$projectname = 'anttiproject',
$first_time_setup= 'true', 
) {

  package {"git":
 	ensure => present,
  }

  
 #creating two reops
  file { "/opt/git/$projectname.git":
    ensure => "directory",
    owner  => 'git',
    group  => $projectname,
    mode   => 0774,
    require => Package['git']
  } 
  
  
  file { "/opt/git/$projectname-be.git":
    ensure => "directory",
    owner  => 'git',
    group  => $projectname,
    mode   => 0774,
    require => Package['git']
  }


  if $first_time_setup == 'true'{
   exec { "create new git repo for main project":
     command => "/usr/bin/git init /opt/git/$projectname.git --bare",
     path    => "/usr/bin/git",
     before  => File["/opt/git/$projectname.git", "/opt/git/$projectname.git/hooks/post-receive"]
   }
   notice("created new git repo for front end project and also a checkout repo for deploy")

   exec { "create new git repo for be project":
     command => "/usr/bin/git init /opt/git/$projectname-be.git --bare",
     path    => "/usr/bin/git",
     before  => File["/opt/git/$projectname-be.git"]
   }
   notice("created new git repo for front end project and also a checkout repo for deploy")

  }
  
  file {"/opt/git/$projectname.git/hooks/post-receive":
    content => template("anttiproject/git-post-receive.erb"),
    mode => 0777,
  }

  # ugly quickfix for allowing diffrent users to commit on their own accounts
  cron { "make sure everyone can write to project repo":
    command => "chmod -R a+wr /opt/git/$projectname.git/",
    user    => root,
    minute  => "*/10"
  }

  cron { "make sure everyone can write to project-be repo":
    command => "chmod -R a+wr /opt/git/$projectname-be.git/",
    user    => root,
    minute  => "*/10"
  }

}

include anttiproject::git
