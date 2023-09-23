FROM alpine:3.17

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /run/mysqld  && chmod 777 /run/mysqld

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]