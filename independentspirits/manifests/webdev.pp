class independentspirits::webdev(
$projectname = '',
$serverName = '') {

#enable repo with curl -sL https://rpm.nodesource.com/setup | bash -

  package {'nodejs':
	ensure	=> present,
  }

  # Finally install grunt
  exec { 'install-npm-packs':
      command => "cd /var/www/html/$projectname && /usr/bin/npm -g install grunt-cli karma bower",
      require => Package['nodejs']
  }
 # Finally install grunt
  exec { 'install-npm':
      command => "cd /var/www/html/$projectname && /usr/bin/npm install",
      require => Exec['install-npm-packs']
  }

  exec { 'install-bower':
      command => "cd /var/www/html/$projectname && /usr/bin/bower install",
      require => Exec['install-npm-packs']
  }
  
  exec { 'install-grunt':
      command => "cd /var/www/html/$projectname && /usr/bin/grunt install",
      require => Exec['install-npm-packs']
  }

  exec { 'grunt-watch':
      command => "cd /var/www/html/$projectname && /usr/bin/grunt watch",
      require => Exec['install-grunt']
  }

 
 
  
}
