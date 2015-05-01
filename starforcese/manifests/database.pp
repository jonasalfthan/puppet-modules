class anttiproject::database(
$projectname = 'anttiproject',
$serverName = '',
$databaseName = 'startuple'
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
    user     => 'startuple',
    password =>  postgresql_password('startuple', 'isghwe123d')
  }

}


include anttiproject::database
