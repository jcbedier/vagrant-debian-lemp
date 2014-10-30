class composer {
  Class['php5-cli'] -> Class['composer']

  exec { "install-composer":
    command => "curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin",
    creates => "/usr/local/bin/composer.phar"
  }
}

