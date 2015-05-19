class independentspirits::database(
$projectname = 'independentspirits',
$serverName = '',
$databaseName = 'independentspirits'
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
    user     => 'independentspirits',
    password =>  postgresql_password('independentspirits', 'iswiehf3823d')
  }

}


include independentspirits::database
