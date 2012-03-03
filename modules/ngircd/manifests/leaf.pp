class ngircd::leaf inherits ngircd {
	@@concat::fragment { "ngircd_connect_${::fqdn}":
		target => "/etc/ngircd/ngircd.conf",
		content => template("ngircd/connect.erb"),
		tag => "ngircd-connect"
	}

	concat::fragment { "ngircd_listen":
		target => "/etc/ngircd/ngircd.conf",
		content => template("ngircd/listen.erb"),
	}
}
