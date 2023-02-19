class profile::docker {
  class { 'docker':
    registry_mirror  => 'http://registry.infrastructure.lab.reisman.org:5000',
    extra_parameters => '--insecure-registry registry.infrastructure.lab.reisman.org:5000',
  }
  -> User <| title == provisioned-user |> { groups +> 'docker' }
}
