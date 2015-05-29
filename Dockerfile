FROM alpine:latest
MAINTAINER Abiola Ibrahim

RUN apk add --update openssh git

RUN mkdir /caddysrc \
&& cd /caddysrc \
&& curl -sLO https://github.com/mholt/caddy/releases/download/v0.7.0/caddy_linux_amd64.zip\
&& unzip caddy_linux_amd64.zip \
&& mv caddy /usr/bin/caddy \
&& chmod 755 /usr/bin/caddy \
&& rm -rf /caddysrc

RUN mkdir /srv

EXPOSE 2015

WORKDIR /srv

CMD /usr/bin/caddy --conf /etc/Caddyfile