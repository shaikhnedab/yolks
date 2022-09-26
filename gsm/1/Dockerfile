FROM        ubuntu:20.04

LABEL       author="Shaikh Nedab" maintainer="shaikhnedab@gmail.com"

RUN apt update  \
    && apt -y clean \
    && apt -y purge python3.8 \
    && apt install -y iproute2 \
    && apt install -y curl \
	&& curl -sL https://deb.nodesource.com/setup_16.x | bash - \
	&& apt install -y nodejs \
	&& apt install -y python3.9 \
	&& apt install -y python3-pip \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]