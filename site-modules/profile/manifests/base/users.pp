class profile::base::users {
  @user { 'provisioned-user':
    ensure     => 'present',
    name       => $facts['provisioned_user'],
    membership => 'minimum',
    password   => '',
  }

  User <| title == provisioned-user |>
}
