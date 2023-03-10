.PHONY: help install test uninstall

install: \
	node_modules

test: install
	npx --no -- jest

uninstall:
	rm -rf node_modules

node_modules:
	npm install
