class profile::docker {
  class { 'docker': }
  -> User <| title == provisioned-user |> { groups +> 'docker' }
}
