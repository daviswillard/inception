all:	up

up:
	@printf "Creating and starting containers...\n"
	@docker volume create portainer_data
	@docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always \
		-v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.11.1 &>/dev/null 2>&1 &
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d

down:
	@printf "Stopping and removing containers, networks...\n"
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down
	@docker stop portainer

clean:
	@printf "Stopping and removing containers, networks, images, volumes...\n"
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down --rmi local --volumes
	@sudo rm -rf ~/data/mariadb
	@sudo rm -rf ~/data/wordpress
	@docker stop portainer
	@docker rm -f -v portainer

re:	clean up

.PHONY	: all build down re clean
