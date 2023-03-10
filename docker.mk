.PHONY: help build bash clean

TAG := tamakiii-sandbox/hello-gha-docker
WORKDIR :=  /usr/local/tamakiii-sandbox/hello-gha-docker

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: Dockerfile
	docker build -t $(TAG) .

bash: build
	docker run -it --rm -v $(PWD):$(WORKDIR) -w $(WORKDIR) $(TAG) $@

clean:
	docker image rm $(TAG)
