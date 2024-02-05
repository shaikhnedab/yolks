FROM        node:18.17.1-alpine

LABEL       author="Shaikh Nedab" maintainer="shaikhnedab@gmail.com"

RUN         apk add --update --no-cache ca-certificates tzdata \
			&& adduser -D -h /home/container container
				
	        && corepack enable \
            && corepack prepare pnpm@7.18.0 --activate


USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]