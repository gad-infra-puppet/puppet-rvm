class rvm::passenger::nginx::ubuntu::pre {

  # Dependencies
  if ! defined(Package['nginx'])                { package { 'nginx':                ensure => installed } }
  if ! defined(Package['build-essential'])      { package { 'build-essential':      ensure => installed } }
  if ! defined(Package['nginx-dev'])            { package { 'nginx-dev':            ensure => installed } }
  if ! defined(Package['libcurl4-openssl-dev']) { package { 'libcurl4-openssl-dev': ensure => installed } }
}
