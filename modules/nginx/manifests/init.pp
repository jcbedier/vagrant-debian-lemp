class nginx {

  package { "nginx":
    ensure => present,
    require => Exec["apt-get update"]
  }

  file { "/etc/nginx/sites-available/default":
    ensure => present,
    source => "/vagrant/manifests/nginx",
    require => Package["nginx"],
  }

  file { "/etc/nginx/sites-enabled/default":
    ensure => link,
    target => "/etc/nginx/sites-available/default",
    require => File["/etc/nginx/sites-available/default"],
    notify => Service["nginx"],
  }

  service { "nginx":
    ensure => running,
    require => Package["nginx"],
   subscribe => [
      File["/etc/nginx/sites-available/default"]
    ],
  }
}
