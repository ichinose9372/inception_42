all : 
	@sudo mkdir -p /home/yichinos/data/mariadb
	@sudo mkdir -p /home/yichinos/data/wordpress
	@sudo chown -R 1000:1000 /home/yichinos/data/wordpress
	@sudo chown -R 1000:1000 /home/yichinos/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build -d

clean :
	docker-compose -f srcs/docker-compose.yml down
	docker volume rm $(docker volume ls -q)

# nginx : 
# 	cd srcs && docker-compose exec nginx sh

# wp :
# 	cd srcs && docker-compose exec wordpress sh

# db : 
# 	cd srcs && docker-compose exec mariadb sh
