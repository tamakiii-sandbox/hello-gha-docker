.PHONY: help install test uninstall

install: \
	node_modules

test:
	npx --no -- jest

uninstall:
	rm -rf node_modules

node_modules:
	npm install
