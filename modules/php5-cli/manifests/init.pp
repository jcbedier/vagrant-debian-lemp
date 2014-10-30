class php5-cli {

  package { "php5-cli":
    ensure => present,
    require => Exec["apt-get update"]
  }
}

