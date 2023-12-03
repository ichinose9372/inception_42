all: up

up:
	@sudo systemctl stop nginx
	@sudo mkdir -p /home/yichinos/data/db 
	@sudo mkdir -p /home/yichinos/data/wordpress 
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	@if docker network inspect srcs_default > /dev/null 2>&1; then \
		docker-compose -f srcs/docker-compose.yml down; \
	fi

clean:
	docker-compose -f srcs/docker-compose.yml down
	docker volume rm srcs_db
	docker volume rm srcs_wordpress
	sudo rm -rf /home/yichinos/data/db
	sudo rm -rf /home/yichinos/data/wordpress

bonus:

logs:
	docker-compose -f srcs/docker-compose.yml logs

nginx:
	cd srcs && docker-compose exec -it srcs_nginx_1 sh

wp:
	cd srcs && docker-compose exec -it srcs_wordpress_1 sh

db:
	cd srcs && docker-compose exec -it srcs_mariadb_1 sh

re: clean all

.PHONY: all up down clean bonus logs nginx wp db re
