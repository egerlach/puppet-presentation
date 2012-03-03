node default {
	class { "ngircd":
		ircname => $::fqdn,
		infotext => "Run with awesomeness"
	}
}
