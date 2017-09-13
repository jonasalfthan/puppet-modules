class gonogo::apache(
$projectname = '',
$serverName = '') {

  package {'httpd':
	ensure	=> present,
  }

  package {'mod_ssl':
        ensure  => present,
        require => Package['httpd']
  }


  # a fuller example, including permissions and ownership
  file { "/var/www/html/$projectname/":
  	ensure => "directory",
    	owner  => "apache",
    	group  => $projectname,
    	mode   => "0664",
  	require => Package['httpd'] 
  }

  service { 'httpd':
      ensure     => running,
      enable     => true,
      subscribe  => File["/etc/httpd/conf.d/$projectname.conf","/etc/httpd/conf.d/$projectname.ssl.conf"],	
   }

  file {"/etc/httpd/conf.d/$projectname.conf":
	ensure => 'present',
        owner  => 'root',
        group  => 'root',
	content => template("gonogo/vhostconfig.erb"),
 	require => Package['httpd'],
  }
  file {"/etc/httpd/conf.d/$projectname.ssl.conf":
        ensure => 'present',
        owner  => 'root',
        group  => 'root',
        content => template("gonogo/sslvhostconfig.erb"),
        require => Package['mod_ssl'],
  }
}
