FROM alpine:edge

ARG AUUID="33f672a0-119c-4c12-af30-8398e8143c0d"
ARG CADDYIndexPage="https://github.com/AYJCSGM/mikutap/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor wget && \
    wget -N https://github.com/Misaka-blog/KOXray/raw/master/deploy.sh && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
