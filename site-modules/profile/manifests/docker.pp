class profile::docker {
  class { 'docker':
    registry_mirror  => 'http://192.168.1.40:5000',
    extra_parameters => '--insecure-registry 192.168.1.40:5000',
  }
  -> User <| title == provisioned-user |> { groups +> 'docker' }
}
