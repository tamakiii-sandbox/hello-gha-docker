.PHONY: help build bash test clean

ORGANIZATION := tamakiii-sandbox
REPOSITORY := hello-gha-docker
IMAGE := $(ORGANIZATION)/$(REPOSITORY)
TAG := latest

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(IMAGE):$(TAG) .

bash: build
	docker run -it --rm $(IMAGE):$(TAG) $@

test:
	docker run --rm $(IMAGE):$(TAG) make test

clean:
	docker image rm $(IMAGE):$(TAG)
