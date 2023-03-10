FROM amazonlinux:2023.0.20230308.0

RUN dnf install -y \
      which \
      less \
      make \
      nodejs \
      && \
    dnf clean all && \
    rm -rf /var/cache/dnf
