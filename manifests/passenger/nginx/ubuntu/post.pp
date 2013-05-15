class rvm::passenger::nginx::ubuntu::post(
  $ruby_version,
  $version,
  $rvm_prefix = '/usr/local/',
  $mininstances = '1',
  $maxpoolsize = '6',
  $poolidletime = '300',
  $maxinstancesperapp = '0',
  $spawnmethod = 'smart-lv2',
  $gempath,
  $binpath
) {

  exec {
    'passenger-install-nginx-module':
      command   => "${binpath}rvm ${ruby_version} exec passenger-install-nginx-module -a",
      creates   => "${gempath}/passenger-${version}/ext/nginx/mod_passenger.so",
      logoutput => 'on_failure',
      require   => [Rvm_gem['passenger'], Package['nginx', 'build-essential', 
                                                  'libcurl4-openssl-dev']],
  }

#  file {
#    '/etc/nginx/mods-available/passenger.load':
#      ensure  => file,
#      content => "LoadModule passenger_module ${gempath}/passenger-${version}/ext/nginx/mod_passenger.so",
#      require => Exec['passenger-install-nginx-module'];
#
#    '/etc/nginx/mods-available/passenger.conf':
#      ensure  => file,
#      content => template('rvm/passenger-nginx.conf.erb'),
#      require => Exec['passenger-install-nginx-module'];
#
#    '/etc/nginx/mods-enabled/passenger.load':
#      ensure  => 'link',
#      target  => '../mods-available/passenger.load',
#      require => File['/etc/nginx/mods-available/passenger.load'];
#
#    '/etc/nginx/mods-enabled/passenger.conf':
#      ensure  => 'link',
#      target  => '../mods-available/passenger.conf',
#      require => File['/etc/nginx/mods-available/passenger.conf'];
#  }
#
#  # Add Apache restart hooks
#  if defined(Service['nginx']) {
#    File['/etc/nginx/mods-available/passenger.load'] ~> Service['nginx']
#    File['/etc/nginx/mods-available/passenger.conf'] ~> Service['nginx']
#    File['/etc/nginx/mods-enabled/passenger.load']   ~> Service['nginx']
#    File['/etc/nginx/mods-enabled/passenger.conf']   ~> Service['nginx']
#  }
#  if defined(Service['nginx']) {
#    File['/etc/nginx/mods-available/passenger.load'] ~> Service['nginx']
#    File['/etc/nginx/mods-available/passenger.conf'] ~> Service['nginx']
#    File['/etc/nginx/mods-enabled/passenger.load']   ~> Service['nginx']
#    File['/etc/nginx/mods-enabled/passenger.conf']   ~> Service['nginx']
#  }
#  if defined(Service['httpd']) {
#    File['/etc/nginx/mods-available/passenger.load'] ~> Service['httpd']
#    File['/etc/nginx/mods-available/passenger.conf'] ~> Service['httpd']
#    File['/etc/nginx/mods-enabled/passenger.load']   ~> Service['httpd']
#    File['/etc/nginx/mods-enabled/passenger.conf']   ~> Service['httpd']
#  }
}
