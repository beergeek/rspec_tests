class rspec_tests::clown {

  file { '/tmp/clowns':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { '/tmp/clown0':
    ensure => file,
  }
}
