FROM alpine:3.17

RUN apk update && apk add --no-cache mariadb-client \
		wget \
		curl \
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
COPY ./conf/php-fpm.conf /etc/php81/php-fpm.conf
COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp
RUN mkdir -p /var/log/php-fpm && \
	touch /var/log/php-fpm/error.log && \
	touch /var/log/php-fpm/access.log && \
	chown -R nginx:nginx /var/log/php-fpm && \
	chmod -R 777 /var/log/php-fpm

COPY ./tool/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]

