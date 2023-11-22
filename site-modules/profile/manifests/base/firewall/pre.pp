class profile::base::firewall::pre {
  Firewall {
    require => undef,
  }

  # Default firewall rules
  firewall { '00000 accept all icmp':
    proto => 'icmp',
    jump   => 'accept',
  }
  -> firewall { '00001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    jump    => 'accept',
  }
  -> firewall { '00002 reject local traffic not on loopback interface':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    jump        => 'reject',
  }
  -> firewall { '00003 accept related established rules':
    proto   => 'all',
    ctstate => ['RELATED', 'ESTABLISHED'],
    jump    => 'accept',
  }
}
