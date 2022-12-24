# profile/base.pp
# Only put classes here that ALL nodes should have
class profile::base {
  include profile::base::firewall
  include profile::base::sshd
}
