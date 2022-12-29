class profile::base::users {
  @user { 'provisioned-user':
    ensure     => 'present',
    name       => $facts['identity']['user'],
    managehome => true,
    membership => 'minimum',
    password   => '',
  }

  User <| title == provisioned-user |>
}
