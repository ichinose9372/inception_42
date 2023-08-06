FROM alpine:3.17

RUN apk --no-caches update && apk add --no-caches mysql-client php-fpm\
        php81 \
        php81-phar\
        php81-common\
        php81-session\
        php81-iconv\
        php81-json\
        php81-gb\
        php81-curl\
        php81xml\
        php81mysqli\
        php81-imap\
        php81-cgi\
        fcgi\
        php81-pdo\
        php81pdo_mysql\
        php81-soap\
        php81-psox\
        php81-tokenizer\
        php81-gettext\
        php81-ldap\
        php81-ctype\
        php81-dom\
        php81simplexml

RUN adduser -S nginx && addgroup -S nginx
COPY ./conf/php-fpm.conf /etc/php8/php-fpm.conf
COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

COPY ./tool/setup.sh /

RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]
