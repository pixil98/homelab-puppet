class profile::base::firewall::post {
  firewall { '99999 drop all':
    proto  => 'all',
    jump   => 'drop',
    before => undef,
  }
}
