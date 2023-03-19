class profile::docker {
  class { 'docker':
    proxy            => 'http://registry.infrastructure.lab.reisman.org:3128',
    extra_parameters => '--insecure-registry registry.infrastructure.lab.reisman.org:3128',
  }
  -> User <| title == provisioned-user |> { groups +> 'docker' }
}
