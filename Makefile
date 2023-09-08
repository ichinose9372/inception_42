all : 
	@sudo mkdir -p /home/yichinos/data/db 
	@sudo mkdir -p /home/yichinos/data/wordpress 
	docker-compose -f srcs/docker-compose.yml up --build -d

clean :
	docker-compose -f srcs/docker-compose.yml down
	docker volume rm  srcs_db
	docker volume rm  srcs_wordpress
	sudo rm -rf /home/yichinos/data/db
	sudo rm -rf /home/yichinos/data/wordpress

logs :
	docker-compose -f srcs/docker-compose.yml logs 
nginx : 
	cd srcs && docker-compose exec nginx sh

wp :
	cd srcs && docker-compose exec wordpress sh

db : 
	cd srcs && docker-compose exec mariadb sh
