.PHONY: help build bash test clean

ORGANIZATION := tamakiii-sandbox
REPOSITORY := hello-gha-docker
IMAGE := $(ORGANIZATION)/$(REPOSITORY)
TAG := latest
WORKDIR :=  /usr/local/tamakiii-sandbox/hello-gha-docker

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash: build
	docker run --rm -v $(PWD):$(WORKDIR) -w $(WORKDIR) $(IMAGE):$(TAG) $@

test:
	docker run --rm -v $(PWD):$(WORKDIR) -w $(WORKDIR) $(IMAGE):$(TAG) make test

clean:
	docker image rm $(IMAGE):$(TAG)
