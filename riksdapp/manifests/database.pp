class riksdapp::database(
$projectname = 'riksdapp',
$serverName = '',
$databaseName = 'riksdapp'
) {

  class { 'postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    postgres_password          => 'XX',
    listen_addresses           => '*',
    ipv4acls                   => ['host all all 0.0.0.0/0 trust'],
    port  		       => '5432',
  }
  ->
  postgresql::server::db { "$databaseName":
    user     => 'riksdapp',
    password =>  postgresql_password('riksdapp', 'XX')
  }

}


include riksdapp::database
