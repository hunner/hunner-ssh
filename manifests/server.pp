class ssh::server (
  $permitrootlogin = 'no',
  $extrarules      = [],
  $listenipports   = {},
  $x11forwarding   = 'no',
  $usepam          = 'yes',
) {
  package {'openssh-server':
    ensure => latest;
  }
  # Template uses: $permitrootlogin, $extrarules, $listenipports, $x11forwarding, $ipaddress, $usepam
  file { '/etc/ssh/sshd_config':
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('ssh/sshd_config.erb'),
    notify  => Service['ssh'],
  }
  service { 'ssh':
    ensure     => running,
    enable     => true,
    require    => Package['openssh-server'],
    subscribe  => File['/etc/ssh/sshd_config'],
  }
}
