package main

    "system": {
        "host-name": "ExpoA4",
        "services": {
	    "ssh": {
		"protocol-version": "v2"
	    }
        }
    },
    "interfaces": {
        "me-0": {
            "unit 0": {
                "family inet": {
                    "address": "192.168.255.76/24"
                }
            }
        }
    }
}


test_a_simple_config {
    allow with input as {"system": { "host-name": "ExpoA4", "services": {"ssh": {"protocol-version": "v2"} }}}
}

test_a_simple_config_bad {
    deny with input as {"system": { "services": {"ssh": {"protocol-version": "v2"} }}}
}

test_management_inf{
    allow with input as {"system": { "host-name": "ExpoA4", "services": {"ssh": {"protocol-version": "v2"} }}, "interfaces": { "me-0": { "unit 0": {"family inet": {"address": "192.168.255.76/25" }}}}}
}
