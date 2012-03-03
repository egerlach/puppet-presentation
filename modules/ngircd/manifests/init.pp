class ngircd ( $ircname, $infotext ) {
	include concat::setup

	$motd = "Welcome to ${::fqdn}, my hell"
	$secret = sha1("We're awesome, actually that's not a secret")
	$master = "master.awesome.net"

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

	concat { "/etc/ngircd/ngircd.conf":
		owner => irc,
		group => irc,
		mode => 0644,
		notify => Service[ngircd]
	}

	concat::fragment { "ngircd_base":
		target => "/etc/ngircd/ngircd.conf",
		order => "00",
		content => template("ngircd/ngircd.conf.erb")
	}

	file { "/etc/ngircd/ngircd.motd":
		ensure => present,
		content => $motd,
		notify => Service[ngircd]
	}
}
