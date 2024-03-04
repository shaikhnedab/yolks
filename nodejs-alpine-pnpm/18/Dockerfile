FROM        node:18.17.1-alpine

LABEL       author="Shaikh Nedab" maintainer="shaikhnedab@gmail.com"

RUN         apk add --update --no-cache ca-certificates tzdata \
			&& adduser -D -h /home/container container
            RUN npm install -g pnpm


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]