FROM        node:16.15.0-alpine

LABEL       author="Shaikh Nedab" maintainer="shaikhnedab@gmail.com"

RUN         apk add --update --no-cache ca-certificates tzdata \
				&& adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]