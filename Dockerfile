FROM ubuntu:wily

MAINTAINER Zankard <zankard@gmail.com>

RUN deps="build-essential git make golang ca-certificates" \
    && apt-get -y update && apt-get install -y $deps --no-install-recommends \
    && git clone https://github.com/getqujing/qtunnel.git \
    && cd qtunnel \
    && make \
    && cp bin/qtunnel /bin \
    && apt-get purge -y --auto-remove git make build-essential

ENTRYPOINT ["/bin/qtunnel", "-crypto=aes256cfb"]
