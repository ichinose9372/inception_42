FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# RUN apk add openssl && mkdir /etc/nginx/ssl \
# 	&& cd /etc/nginx/ssl \
# 	&& openssl req -x509 \
# 			-nodes \
# 			-subj "/CN=JP" \
# 			-out nginx.crt \
# 			-keyout nginx.key\
# 	&& chmod +r nginx.crt nginx.key
	
RUN mkdir -p /run/nginx
WORKDIR /var/www/html

EXPOSE 443

CMD ["nginx" , "-g" , "daemon off;"]