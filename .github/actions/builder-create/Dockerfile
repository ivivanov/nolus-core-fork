FROM amazon/aws-cli:2.17.38

RUN apk add curl tar && \
  curl -s https://download.docker.com/linux/static/stable/x86_64/docker-20.10.9.tgz | tar -xzf-

ENV DOCKER_HOST="tcp://docker:2376" \
    DOCKER_TLS_VERIFY=1 \
    DOCKER_TLS_CERTDIR="/certs" \
    DOCKER_CERT_PATH="/certs/client"

COPY --from=0 /docker/docker /usr/local/bin
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
