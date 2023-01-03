class profile::artifactory {
  package { 'artifactory':
    ensure   => installed,
    provider => dpkg,
    source   => "https://releases.jfrog.io/artifactory/artifactory-debs/pool/jfrog-artifactory-oss/jfrog-artifactory-oss-${facts['os.distro.codename']}.deb",
  }
}
