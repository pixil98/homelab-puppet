class profile::base::firewall {
  include firewall

  # Set default to purge unmanaged firewall resources
  #resources { 'firewall':
  #  purge => true,
  #}
  #resources { 'firewallchain':
  #  purge => true,
  #}

  # Make sure firewall rules fall in between pre/post
  Firewall {
    before  => Class['profile::base::firewall::post'],
    require => Class['profile::base::firewall::pre'],
  }
  class { ['profile::base::firewall::pre', 'profile::base::firewall::post']: }
}
