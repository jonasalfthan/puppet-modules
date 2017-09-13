class riksdapp::webserver(
$projectname = '',
$serverName = '') {

file {['/opt/riksdapp','/opt/riksdapp/prod']: 
    ensure                  => directory,
    owner                   => 'root'
}

class { 'apache': }

apache::vhost { 'prod':
  port    => '80',
  docroot => '/opt/riksdapp/prod',
}


}

include riksdapp::webserver
