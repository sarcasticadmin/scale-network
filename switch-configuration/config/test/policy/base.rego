package main

default allow = false

set_mgmt_address {
	input.interfaces["me-0"]["unit 0"]["family inet"].address == "192.168.255.76/24"
}

set_ssh_v2 {
	input.system.services.ssh["protocol-version"] == "v2"
}

has_hostname {
	input.system["host-name"]
}

allow {
	has_hostname
	set_mgmt_address
	set_ssh_v2
}
