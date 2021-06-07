# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:2-alpine

LABEL       author="AntiBotCloud" maintainer="AntiBotCloud"

RUN         set -ex && apk --no-cache add sudo
RUN         apk --update add libxml2-dev libxslt-dev libffi-dev gcc musl-dev libgcc openssl-dev curl
RUN         apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev
RUN         pip install Pillow

RUN         apk add git --no-cache \
            && apk add bash \
            && apk add python3-dev \
            && apk add build-base \
            && apk add tar --no-cache \
            && apk add curl --no-cache \
            && apk add wget --no-cache \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
