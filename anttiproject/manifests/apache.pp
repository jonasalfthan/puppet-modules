class anttiproject::apache(
$projectname = '',
$serverName = '') {

  package {'httpd':
	ensure	=> present,
  }

  # a fuller example, including permissions and ownership
  file { "/var/www/html/$projectname/":
  	ensure => "directory",
    	owner  => "apache",
    	group  => $projectname,
    	mode   => 0664,
  	require => Package['httpd'] 
  }

  service { 'httpd':
      ensure     => running,
      enable     => true,
      subscribe  => File["/etc/httpd/conf.d/$projectname.conf"],
   }

  file {"/etc/httpd/conf.d/$projectname.conf":
	ensure => 'present',
        owner  => 'root',
        group  => 'root',
	content => template("anttiproject/vhostconfig.erb"),
 	require => Package['httpd'],
  }
}
