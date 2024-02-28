FROM        --platform=$TARGETOS/$TARGETARCH debian:11-slim

LABEL       author="Matthew Penner" maintainer="shaikhnedab@gmail.com"

LABEL       org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

RUN         dpkg --add-architecture i386 \
				&& apt update \
				&& apt upgrade -y \
				&& apt -y --no-install-recommends install ca-certificates curl lib32gcc-s1 libsdl2-2.0-0:i386 git wget