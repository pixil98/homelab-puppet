class profile::docker_registry {
  class { 'docker': }
  -> User <| title == provisioned-user |> { groups +> 'docker' }

  docker::image { 'rpardini/docker-registry-proxy':
    image_tag => '0.6.4',
  }
  -> docker::run { 'rpardini/docker-registry-proxy':
    image => 'rpardini/docker-registry-proxy:0.6.4',
    ports => ['3128:3128'],
    env   => [
      'REGISTRIES="ghcr.io k8s.gcr.io gcr.io quay.io"',
    ],
  }

  firewall { '03128 accept - Docker registry proxy':
    dport  => 3128,
    proto  => tcp,
    action => accept,
  }
}
