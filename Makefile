.PHONY: unit
unit:
	AIVEN_TOKEN="dummy" terraform test --test-directory tests/unit

.PHONY: e2e
e2e:
	cd tests/e2e && go test . -v -timeout 30m
