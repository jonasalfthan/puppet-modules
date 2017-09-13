class gonogo::database(
$projectname = 'gonogo',
$serverName = '',
$databaseName = 'gonogo'
) {

  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.6',
  }->
  class { 'postgresql::server':
    ip_mask_deny_postgres_user => '0.0.0.0/32',
    postgres_password          => 'asoidfjsoiajfwerw',
    listen_addresses           => '*',
    ipv4acls                   => ['host all all 52.57.146.234/32 trust'],
    port  		       => '5432',
  }
  ->
  postgresql::server::db { "$databaseName":
    user     => 'gonogo',
    password =>  postgresql_password('gonogo', 'BqMYBS4ab67HSw4P')
  }

  cron { 'updating materilized view':
    command => "/usr/local/bin/psql -d gonogo -c 'REFRESH MATERIALIZED VIEW profile_questions_view'",
    user    => 'gonogo',
    minute  => 0,
  }
}


include gonogo::database
