class anttiproject::database(
$projectname = 'anttiproject',
$serverName = '',
$databaseName = 'anttiproject'
) {

  class { 'postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    postgres_password          => 'TPaaaSrEs0rt!',
    listen_addresses           => '*',
    ipv4acls                   => ['host all all 0.0.0.0/0 trust'],
    port  		       => '5432',
  }
  ->
  postgresql::server::db { 'anttiproject':
    user     => 'anttiuser',
    password =>  postgresql_password('anttiuser', 'isghwe123d')
  }

}


include anttiproject::database
