class php-fpm {

  package { "php5-fpm":
    ensure => present,
    require => Exec["apt-get update"]
  }
}
