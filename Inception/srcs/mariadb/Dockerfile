FROM debian:bullseye

# Install packages

RUN apt update && apt install -y \
	mariadb-server \
	expect 

# Copy files

COPY ./tools/setup.sh /home/setup.sh

COPY ./tools/expect.exp /home/expect.exp

RUN chmod +x /home/setup.sh

ENTRYPOINT [ "bash",  "/home/setup.sh" ]