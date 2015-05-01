class starforce::database(
$projectname = 'starforce',
$serverName = '',
$databaseName = 'starforce'
) {

  class { 'postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    postgres_password          => 'TPaaaSrEs0rt!',
    listen_addresses           => '*',
    ipv4acls                   => ['host all all 0.0.0.0/0 trust'],
    port  		       => '5432',
  }
  ->
  postgresql::server::db { "$databaseName":
    user     => 'starforce',
    password =>  postgresql_password('starforce', 'iswiehf3823d')
  }

}


include starforce::database
