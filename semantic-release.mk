.PHONY: help verify-conditions analyze-commits verify-release generate-notes

help:
	@cat $(firstword $(MAKEFILE_LIST))

verify-conditions:
	npx --no -- semantic-release --dry-run --verify-conditions

analyze-commits:
	npx --no -- semantic-release --branches main --dry-run --analyze-commits

verify-release:
	npx --no -- semantic-release --branches main --dry-run --verify-release

generate-notes:
	npx --no -- semantic-release --branches main --dry-run --generate-notes
