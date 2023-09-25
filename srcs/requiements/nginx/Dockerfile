FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN apk add openssl && mkdir /etc/nginx/ssl \
    && cd /etc/nginx/ssl \
	&& openssl genrsa -aes128 2048 > server.key \
	&& openssl req -new -key server.key > server.csr \
	&& openssl x509 -in server.csr -days 365 -req -signkey server.key > server.crt \
	&& echo hoge123@ > server.password 
    # && openssl req -x509 \
    #         -newkey rsa:2048 \
    #         -days 365 \
    #         -nodes \
    #         -subj "/C=JP/CN=yichinos.42.jp" \
    #         -out nginx.crt \
    #         -keyout nginx.key \
    # && chmod 644 nginx.crt nginx.key
	
RUN mkdir -p /run/nginx
WORKDIR /var/www/html

EXPOSE 443

CMD ["nginx" , "-g" , "daemon off;"]