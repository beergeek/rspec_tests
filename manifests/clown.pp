class rspec_tests::clown {

  file { '/tmp/clowns':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }
}
