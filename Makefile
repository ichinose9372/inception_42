all : 
	@sudo systemctl stop nginx
	@sudo mkdir -p /home/yichinos/data/db 
	@sudo mkdir -p /home/yichinos/data/wordpress 
	docker-compose -f srcs/docker-compose.yml up --build -d

clean :
	docker-compose -f srcs/docker-compose.yml down

logs :
	docker-compose -f srcs/docker-compose.yml logs 
nginx : 
	cd srcs && docker-compose exec -it srcs_nginx_1 sh

wp :
	cd srcs && docker-compose exec -it srcs_wordpress_1 sh

db : 
	cd srcs && docker-compose exec -it srcs_mariadb_1 sh
