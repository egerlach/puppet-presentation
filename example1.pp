file { "/tmp/puppet/example1":
	ensure => file,
	mode => 0644,
	content => "example1"
}
