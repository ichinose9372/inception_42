FROM alpine:3.14

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]