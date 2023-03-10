.PHONY: help build bash clean

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
	docker run -it --rm -v $(PWD):$(WORKDIR) -w $(WORKDIR) $(IMAGE):$(TAG) $@

clean:
	docker image rm $(IMAGE):$(TAG)
