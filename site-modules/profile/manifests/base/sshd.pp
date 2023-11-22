# Module that configures basic sshd settings
class profile::base::sshd {
  firewall { '00022 accept incoming ssh':
    dport  => 22,
    proto  => 'tcp',
    jump   => 'accept',
  }
}
