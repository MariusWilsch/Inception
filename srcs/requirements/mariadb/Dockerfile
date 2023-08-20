FROM debian:bullseye

# Install packages

RUN apt update && apt install -y mariadb-server 

# Copy files

COPY ./tools/setup.sh /home/setup.sh

RUN chmod +x /home/setup.sh

ENTRYPOINT [ "bash",  "/home/setup.sh" ]