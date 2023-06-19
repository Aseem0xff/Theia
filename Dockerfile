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
        sudo \
        wget \
        zip \
    '
CMD ["/bin/bash"]
RUN curl -qfsSL "https://git.io/go-installer" | bash 
RUN rm $HOME/go*.gz >/dev/null 2>&1
RUN curl -qfsSL "https://tailscale.com/install.sh" | bash
RUN tailscaled --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 --no-logs-no-support >/dev/null 2>&1 &
RUN tailscale up --ssh --hostname="back4app-ubuntu-minimal" --authkey=tskey-auth-kSjxqY6CNTRL-rUyyZwaVmiTQn4jbok5khT1tU7cpZM863
