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
	docker stop $(docker ps -qa); 
	docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa);
	docker volume rm $(docker volume ls -q);
	docker network rm $(docker network ls -q) 2>/dev/null

