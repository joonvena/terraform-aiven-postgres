.PHONY: unit
unit:
	AIVEN_TOKEN="dummy" terraform test --test-directory tests/unit

.PHONY: e2e
e2e:
	cd tests/e2e && go test . -v -timeout 30m

.PHONY: generate-docs
generate-docs:
	docker run --rm --volume "${shell pwd}:/terraform-docs" -u ${shell id -u} quay.io/terraform-docs/terraform-docs:0.16.0 markdown /terraform-docs > README.md
