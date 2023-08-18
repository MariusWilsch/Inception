FROM debian:bullseye

# Install packages

RUN apt-get update && apt-get install -y php-fpm php-mysql curl default-mysql-client

COPY ./tools/setup.sh /home/setup.sh

RUN chmod +x /home/setup.sh

ENTRYPOINT [ "/bin/bash", "/home/setup.sh" ]