FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]