all: 
	docker-compose -f srcs/docker-compose.yml up --build 


# Build all docker images and set up the application using docker-compose.
build:
	docker-compose -f srcs/docker-compose.yml build

# Run all services in detached mode.
run:
	docker-compose -f srcs/docker-compose.yml up

# Stop all running services.
stop:
	docker-compose -f srcs/docker-compose.yml down

# Clean up images, containers, networks, and volumes.
clean:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all

# Aggressively clean all Docker containers, images, networks, and volumes on the machine.
pre-eval-clean:
		docker system prune -af
		rm -rf /Users/verdant/home/mwilsch/data/mariadb/*
		rm -rf /Users/verdant/home/mwilsch/data/wordpress/*