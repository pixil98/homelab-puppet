class profile::docker {
  class { 'docker':
    registry_mirror => 'http://192.168.1.40',
  }
  -> User <| title == provisioned-user |> { groups +> 'docker' }
}
