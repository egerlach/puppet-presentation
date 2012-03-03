class ngircd::no_motd inherits ngircd {
	File["/etc/ngircd/ngircd.motd"] { 
		ensure => absent
	}
}
