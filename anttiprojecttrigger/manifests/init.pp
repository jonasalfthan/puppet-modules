 # /etc/puppet/modules/webserver/manifests/init.pp

#include testproject::params
#include ::testproject2::jonas
include anttiproject#class {'testproject':}
#class {'testproject::subclass':}
#class {'jonas':}
