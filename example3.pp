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

file { "/etc/ngircd/ngircd.conf":
	ensure => present,
	owner => irc,
	group => irc,
	mode => 0644,
	source => "/home/egerlach/puppet/ngircd.conf",
	notify => Service[ngircd]
}
