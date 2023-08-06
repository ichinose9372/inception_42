FROM alpine:3.17

RUN apk update && apk upgrade
RUN apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/localhost.crt \
    -keyout /etc/nginx/ssl/localhost.key \
    -subj "/C=JP/ST=Tokyo/L=city/O=42tokyo/CN=yichinos.42.tokyo"

RUN mkdir -p /run/nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]