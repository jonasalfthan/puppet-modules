class gonogo::database(
$projectname = 'gonogo',
$serverName = '',
$databaseName = 'gonogo'
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
    user     => 'gonogo',
    password =>  postgresql_password('gonogo', 'XX')
  }

}


include gonogo::database
