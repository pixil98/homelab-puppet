class profile::kubernetes::worker {
  #TODO: get user from hiera
  class { 'docker': }
  -> User <| title == provisioned-user |> { groups +> 'docker' }

  # Install nfs tools for mounting nfs volumes
  package { 'nfs-common':
    ensure => present,
  }
  service { 'rpc-statd':
    ensure  => running,
    require => Package['nfs-common'],
  }

  # Open ports as per https://rancher.com/docs/rke/latest/en/os/#ports
  # Port 22 - Already included in base ssh config
  firewall { '00080 accept - Ingress controller (HTTP)':
    dport  => 80,
    proto  => tcp,
    action => accept,
  }
  firewall { '00443 accept - Ingress controller (HTTPS)':
    dport  => 443,
    proto  => tcp,
    action => accept,
  }
  firewall { '02376 accept - Docker daemon TLS port used by Docker Machine (only needed when using Node Driver/Templates)':
    dport  => 2376,
    proto  => tcp,
    action => accept,
  }
  firewall { '07946 accept - Metallb tcp':
    dport  => 7946,
    proto  => tcp,
    action => accept,
  }
    firewall { '07946 accept - Metallb udp':
    dport  => 7946,
    proto  => udp,
    action => accept,
  }
  firewall { '08472 accept - Canal/Flannel VXLAN overlay networking':
    dport  => 8472,
    proto  => udp,
    action => accept,
  }
  firewall { '09099 accept - Canal/Flannel livenessProbe/readinessProbe':
    dport  => 9099,
    proto  => tcp,
    action => accept,
  }
  firewall { '10250 accept - kubelet':
    dport  => 10250,
    proto  => tcp,
    action => accept,
  }
  firewall { '10254 accept - Ingress controller livenessProbe/readinessProbe':
    dport  => 10254,
    proto  => tcp,
    action => accept,
  }
  firewall { '30000 accept - NodePort port range':
    dport  => '30000-32767',
    proto  => tcp,
    action => accept,
  }
}
