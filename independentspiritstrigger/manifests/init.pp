 # /etc/puppet/modules/webserver/manifests/init.pp

#include testproject::params
#include ::testproject2::jonas
include independentspirits#class {'testproject':}
#class {'testproject::subclass':}
#class {'jonas':}
