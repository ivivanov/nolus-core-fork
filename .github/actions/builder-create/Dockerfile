FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apk update && \
    apk add --no-cache \
    curl \
    python3 \
    py3-pip \
    docker-cli \
    bash

RUN pip3 install awscli --upgrade
RUN aws --version && docker --version
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
