class ssh::blacklist {
  package {'openssh-blacklist':
    ensure => latest;
  }
}
