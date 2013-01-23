class ssh::client (
  $forwardagent   = 'no',
  $hashknownhosts = 'yes',
  $extrarules     = [],
) {
  package {'openssh-client':
    ensure => present;
  }
  # Template uses: $forwardagent, $hashknownhosts, $extrarules
  file { '/etc/ssh/ssh_config':
    ensure  => file,
    content => template('ssh/ssh_config.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package['openssh-client'],
  }
}
