FROM amazon/aws-cli:2.17.38 AS aws-cli
FROM docker:20.10-dind AS docker-dind

COPY --from=aws-cli /usr/local/bin/aws /usr/local/bin/aws
RUN apk add --no-cache bash
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
