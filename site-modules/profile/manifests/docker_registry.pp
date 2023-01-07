class profile::docker_registry {
  include profile::docker

  docker::image { 'registry':
    image_tag => '2',
  }
  -> docker::run { 'registry':
    image => 'registry:2',
    ports => ['5000'],
    env   => ['REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io'],
  }

  firewall { '05000 accept - Container Registry':
    dport  => 5000,
    proto  => tcp,
    action => accept,
  }
}
