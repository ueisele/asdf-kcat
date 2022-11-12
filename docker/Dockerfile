ARG FEDORA_VERSION=37
FROM fedora:${FEDORA_VERSION}

RUN dnf groupinstall -y "Development Tools" "Development Libraries" \
  && dnf install -y \
      which curl wget cmake pkg-config python3 gcc-c++ \
      lz4-devel openssl-devel cyrus-sasl-devel \
      brotli-devel libidn2-devel libnghttp2-devel \
      libssh-devel libpsl-devel openssl1.1 cyrus-sasl-lib 

WORKDIR /usr/src/kcat

ARG LIBRDKAFKA_VERSION=v1.9.2
RUN LIBRDKAFKA_VERSION=${LIBRDKAFKA_VERSION} ./bootstrap.sh
RUN bash -c "if [ -f kafkacat ]; then cp kafkacat kcat; fi"