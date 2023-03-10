.PHONY: help build bash test clean

ORGANIZATION := tamakiii-sandbox
REPOSITORY := hello-gha-docker
export IMAGE := $(ORGANIZATION)/$(REPOSITORY)
export TAG := latest

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash: build
	docker run --rm -it -v $(PWD):/usr/local/tamakiii-sandbox/hello-gha-docker $(IMAGE):$(TAG) $@

test:
	docker run --rm $(IMAGE):$(TAG) make test

clean:
	docker image rm $(IMAGE):$(TAG)
