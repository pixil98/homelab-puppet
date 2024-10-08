class profile::kubernetes::controller {
  include profile::docker

  # Open ports as per https://rancher.com/docs/rke/latest/en/os/#ports
  firewall { '00080 accept - Ingress controller (HTTP)':
    dport  => 80,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '00443 accept - Ingress controller (HTTPS)':
    dport  => 443,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '02376 accept - Docker daemon TLS port used by Docker Machine (only needed when using Node Driver/Templates)':
    dport  => 2376,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '02379 accept - etcd client requests':
    dport  => 2379,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '02380 accept - etcd peer communication':
    dport  => 2380,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '06443 accept - Kubernetes apiserver':
    dport  => 6443,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '08472 accept - Canal/Flannel VXLAN overlay networking':
    dport  => 8472,
    proto  => udp,
    jump   => accept,
  }
  firewall { '09099 accept - Canal/Flannel livenessProbe/readinessProbe':
    dport  => 9099,
    proto  => tcp,
    jump   => accept,
  }
    firewall { '09100 accept - node exporter':
    dport  => 9100,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '10250 accept - kubelet':
    dport  => 10250,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '10254 accept - Ingress controller livenessProbe/readinessProbe':
    dport  => 10254,
    proto  => tcp,
    jump   => accept,
  }
  firewall { '30000 accept - NodePort port range':
    dport  => '30000-32767',
    proto  => tcp,
    jump   => accept,
  }
}
