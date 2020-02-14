unit:
	opa test . -v

#conftest test switchtest.json --trace
eval:
	opa eval -i switchtest.json -d policy 'data.main.allow' -f pretty --explain fails
