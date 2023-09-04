all : 
	@sudo mkdir -p /home/yichinos/data/db
	@sudo mkdir -p /home/yichinos/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build

clean :
	docker-compose -f srcs/docker-compose.yml down
	docker volume rm wordpress
	docker volume rm mariadb
	docker volume rm nginx
	docker volume rm adminer

# nginx : 
# 	cd srcs && docker-compose exec nginx sh

# wp :
# 	cd srcs && docker-compose exec wordpress sh

# db : 
# 	cd srcs && docker-compose exec mariadb sh
