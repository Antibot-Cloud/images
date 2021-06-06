# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3.6-alpine

LABEL       author="AntiBotCloud" maintainer="AntiBotCloud"

RUN         apk add git --no-cache \
            && apk add bash \
            && apk add python3-dev \
            && apk add build-base \
            && apk add tar --no-cache \
            && apk add curl --no-cache \
            && apk add jpeg-dev \
            && apk add zlib \
            && pip install Pillow \
            && apk add wget --no-cache \
            && apk del ash \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
