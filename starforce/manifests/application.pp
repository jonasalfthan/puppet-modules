class starforce::application(
$projectname = 'starforce',
$serverName = '') {


  #I put the application inside:
  file { "/usr/$projectname-be":
    ensure => "directory",
    owner  => 'root',
    group  => $projectname,
    mode   => 0660,
  }

  # i put the uploaded files inside:
  file { "/var/lib/$projectname-be":
    ensure => "directory",
    owner  => 'root',
    group  => $projectname,
    mode   => 0660,
  }

  # for checking out project to build it on the server.
  file { "/tmp/$projectname-be":
    ensure => "directory",
    owner  => 'root',
    group  => $projectname,
    mode   => 0660,
  }


  file {"/tmp/$projectname-be.sh":
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    content => template("starforce/be-deployscript.erb"),
    mode  => '0700'
  }

  file {"/etc/init.d/$projectname-be":
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    content => template("starforce/be-init-d.erb"),
    mode  => '0700'
  }


  #adding this for reference. I allow httpd free network access in selinux. Should be enough to open up the ports you need
  # setsebool -P httpd_can_network_connect=true

  #exec {
  #  'run_my_script':
  #   command => '/usr/local/bin/my_bash_script.sh',
  #   refreshonly => true,
  #}
}


#include starforce::users
