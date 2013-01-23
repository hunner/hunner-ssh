include ssh::blacklist
class { 'ssh::client':
  forwardagent   => 'yes',
  hashknownhosts => 'no',
}
class { 'ssh::server':
  permitrootlogin => 'without-password',
  extrarules      => [
    'PasswordAuthentication no',
    'GSSAPIAuthentication no',
    'KerberosAuthentication no',
    'RSAAuthentication no',
    'MaxStartups 10:30:60',
  ],
  listenipports   => {
    'fake dns'  => '0.0.0.0:53',
    'localhost' => '127.0.0.1:22',
  },
}
