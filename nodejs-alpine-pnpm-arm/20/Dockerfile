FROM --platform=linux/arm64 node:20.11.0-alpine

LABEL       author="Shaikh Nedab" maintainer="shaikhnedab@gmail.com"

RUN         apk add --update --no-cache ca-certificates tzdata git && \
			adduser -D -h /home/container container && \
            && npm install -g pnpm


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]