FROM amazonlinux:2023.0.20230308.0

RUN dnf install -y \
      man \
      which \
      less \
      make \
      nodejs \
      && \
    dnf clean all && \
    rm -rf /var/cache/dnf

COPY . /usr/local/tamakiii-sandbox/hello-gha-docker

RUN make -C /usr/local/tamakiii-sandbox/hello-gha-docker install

WORKDIR /usr/local/tamakiii-sandbox/hello-gha-docker
