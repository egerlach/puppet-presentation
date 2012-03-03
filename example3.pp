package { "ngircd":
	provider => "apt",
	ensure => present
}

service { "ngircd":
	ensure => running,
	hasrestart => true,
	hasstatus => true,
	require => Package[ngircd]
}
