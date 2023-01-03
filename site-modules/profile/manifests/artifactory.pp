class profile::artifactory {
  apt::source { 'artifactory':
    location => 'https://releases.jfrog.io/artifactory/artifactory-debs/',
    release  => 'buster',  # Bullseye release does not exist yet
    repos    => 'main',
    key      => {
      id     => 'A3D085F542F740BBD7E3A2846B219DCCD7639232',
      source => 'https://releases.jfrog.io/artifactory/api/gpg/key/public',
    },
  }

  package { 'jfrog-artifactory-oss':
    ensure => present,
  }
}
