file { "/tmp/puppet/example2":
	ensure => directory,
	mode => 0644
}

file { "/tmp/puppet/example2/example3":
	ensure => link,
	target => "/tmp/puppet/example1"
}

notify { "Example notification!": }
