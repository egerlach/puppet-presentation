class ngircd ( $ircname, $infotext ) {
	$motd = "Welcome to ${::fqdn}, my hell"

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
		content => template("ngircd/ngircd.conf.erb"),
		notify => Service[ngircd]
	}

	file { "/etc/ngircd/ngircd.motd":
		ensure => present,
		content => $motd,
		notify => Service[ngircd]
	}
}
