FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache nginx 

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

RUN apk add --no-cache openssl && \
	mkdir -p /etc/nginx/ssl && \
	cd /etc/nginx/ssl && \
	openssl req -x509 \
				-nodes \
				-subj "/CN=JP" \
    			-out /etc/nginx/ssl/nginx.crt \
    			-keyout /etc/nginx/ssl/nginx.key 
WORKDIR /var/www/html

CMD ["nginx", "-g", "daemon off;"]