all: up

up:
	@sudo systemctl stop nginx
	@sudo mkdir -p /home/yichinos/data/db 
	@sudo mkdir -p /home/yichinos/data/wordpress 
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	
	docker-compose -f srcs/docker-compose.yml down;

clean:
	@if docker network inspect srcs_inception-network > /dev/null 2>&1; then \
		docker-compose -f srcs/docker-compose.yml down; \
	fi
	@if docker volume inspect srcs_db > /dev/null 2>&1; then \
		docker volume rm srcs_db; \
	fi
	@if docker volume inspect srcs_wordpress > /dev/null 2>&1; then \
		docker volume rm srcs_wordpress; \
	fi
	sudo rm -rf /home/yichinos/data/db
	sudo rm -rf /home/yichinos/data/wordpress



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
