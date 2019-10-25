package main

test_set_mgmt_address {
	set_mgmt_address with input as {"interfaces": {"me-0": {"unit 0": {"family inet": {"address": "192.168.255.76/24"}}}}}
}

test_set_mgmt_address_bad {
	not set_mgmt_address with input as {"interfaces": {"me-0": {"unit 0": {"family inet": {"address": "192.168.255.76/25"}}}}}
}

test_set_mgmt_address_missing {
	not set_mgmt_address with input as {"interfaces": {"ge/0/0": {"unit 0": {"family inet": {"address": "192.168.1.1/24"}}}}}
}

test_set_ssh_v2 {
	set_ssh_v2 with input as {"system": {"services": {"ssh": {"protocol-version": "v2"}}}}
}

test_set_ssh_v2_bad {
	not set_ssh_v2 with input as {"system": {"services": {"ssh": {"protocol-version": "v1"}}}}
}

test_has_hostname {
	has_hostname with input as {"system": {"host-name": "ExpoA4"}}
}

test_has_hostname_missing {
	not has_hostname with input as {"system": {"missing-host-name": "ExpoA4"}}
}
