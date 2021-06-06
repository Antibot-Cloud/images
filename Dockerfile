# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3-alpine

LABEL       author="Alex G." maintainer="admin@mg100.net"

RUN         apk add git --no-cache \
            && apk add build-base --no-cache \
            && apk add tar --no-cache \
            && apk add curl --no-cache \
            && apk add wget --no-cache \
            && apk add screen --no-cache \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
