class apache::install {
  case $::osfamily {
    RedHat: {
      $http_package = 'httpd'
    }
    Debian,Ubuntu: {
      $http_package = 'apache2'
    }
    default: {
      fail("${::hostname}: This module does not support operatingsystem ${::operatingsystem}")
    }
  }

  package { $http_package:
    ensure => installed,
    alias  => 'httpd'
  }
}
