FROM alpine:latest
MAINTAINER Vladimir Kozlovski <inbox@vladkozlovski.com>

# To interact with the Docker API install CURL
RUN apk --update add curl && \
    rm -rf /var/cache/apk/*

ENV CONSUL_TEMPLATE_VERSION 0.10.0

ADD https://github.com/hashicorp/consul-template/releases/download/v${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz /

RUN tar zxvf consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz && \
    mv consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64/consul-template /usr/local/bin/consul-template && \
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz && \
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64 && \
    mkdir -p /consul-template /consul-template/config.d /consul-template/templates

CMD [ "/usr/local/bin/consul-template"]