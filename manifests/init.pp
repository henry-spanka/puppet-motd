# Install and adapt a very detailed MOTD
class motd (
  $packages     = undef,
  $important    = undef,
  $profile_file = '/etc/profile.d/motd.sh',
  $motd_file    = '/usr/local/bin/motd.sh',
) {
  file { $profile_file:
    ensure  => 'file',
    path    => $profile_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('motd/profile.erb'),
  }
  file { $motd_file:
    ensure  => 'file',
    path    => $motd_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('motd/motd.erb'),
  }
}
