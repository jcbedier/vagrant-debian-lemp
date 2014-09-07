class memcached {

  package { "memcached":
    ensure => present,
    require => Exec["apt-get update"]
  }

  package { "php5-memcached":
    ensure => present,
    require => Exec["apt-get update"],
  }

  file { "/etc/memcached.conf":
    ensure => present,
    source => "/vagrant/manifests/memcached",
    require => Package["memcached"],
  }

  service { "memcached":
    ensure => running,
    require => Package["memcached"],
    subscribe => [
      File["/etc/memcached.conf"]
    ]
  }
}
