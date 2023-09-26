FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx openssl && mkdir -p /etc/nginx/ssl	

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
	-subj "/C=JP/CN=localhost"
	
RUN mkdir -p /run/nginx
WORKDIR /var/www/html

EXPOSE 443

CMD ["nginx" , "-g" , "daemon off;"]