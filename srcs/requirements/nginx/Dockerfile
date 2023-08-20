FROM debian:bullseye

# Install nginx

RUN apt-get update && apt-get install -y nginx openssl  && rm -rf /var/lib/apt/lists/*

# Copy nginx config

COPY setup.sh /home/setup.sh

ENTRYPOINT [ "bash", "/home/setup.sh"]