FROM alpine:3.14

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY my.cnf /etc/my.cnf
COPY setup.sh /tmp/setup.sh

RUN chmod +x /tmp/setup.sh

ENTRYPOINT ["/tmp/setup.sh"]
CMD ["mysqld", "--user=root"]