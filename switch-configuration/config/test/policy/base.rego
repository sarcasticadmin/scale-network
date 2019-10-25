package main

deny[msg] {
	not input.system["host-name"]
	msg == "Config must set a hostname"
}

deny[msg] {
	not input.interfaces["me-0"]["unit 0"]["family inet"].address == "192.168.255.76/24"
	msg = "Expecting management port to be on designated subnet"
}

allow {
	input.system.services.ssh["protocol-version"] == "v2"
	msg = "ssh needs to be set to v2"
}
