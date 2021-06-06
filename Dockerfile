# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3-alpine

LABEL       author="AntiBotCloud" maintainer="AntiBotCloud"

RUN         apk add git --no-cache \
            && apk add bash \
            && apk add python3-dev --no-cache \
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

CMD         ["/bin/bash", "/entrypoint.sh"]
