FROM alpine:3.17

RUN apk update && apk add --no-cache mysql-client \
		wget \
		curl \
		php81-fpm \
		php81 \
		php81-fpm\
		php81-mysqli\
		php81-mbstring\
		php81-xml\
		php81-curl\
		php81-phar\
		php81-zip\
		php81-intl\
		php81-opcache\
		php81-openssl\
		fcgi

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
