.PHONY: help install uninstall

install: \
	node_modules

uninstall:
	rm -rf node_modules

node_modules:
	npm install
