# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3-alpine

LABEL       author="Michael Parker" maintainer="docker@parkervcp.com"

RUN         apk add --no-cache --update \
            apk add openssh
            rc-update add sshd
            rc-status
            /etc/init.d/sshd start
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
