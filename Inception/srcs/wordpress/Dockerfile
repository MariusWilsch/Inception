FROM debian:bullseye

# Install packages

RUN apt update && apt install -y php-fpm php-mysql curl

COPY ./tools/setup.sh /home/setup.sh

COPY ./tools/wait-for-it.sh /home/wait-for-it.sh

RUN chmod +x /home/setup.sh

ENTRYPOINT [ "/bin/bash", "/home/setup.sh" ]