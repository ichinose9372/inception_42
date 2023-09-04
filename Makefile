all : 
	sudo mkdir -p /home/yichinose
	echo "user42" | sudo -S chmod 777 /home/yichinose
	sudo mkdir -p /home/yichinose/data
	echo "user42" | sudo -S chmod 777 /home/yichinose/data

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
