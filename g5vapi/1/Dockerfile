FROM        ubuntu:20.04

LABEL       author="Shaikh Nedab" maintainer="shaikhnedab@gmail.com"

RUN apt update  \
    && apt -y clean \
	&& apt -y install iproute2 ca-certificates \
    && apt install -y curl \
	
	&& curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash \
	&& nvm install 14.17.5 \
	
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
	&& apt install -y --no-install-recommends yarn \
	
	&& apt install -y redis-server \
	&& service mariadb start \
	&& service mariadb enable \
	
    && adduser --disabled-password --home /home/container container

USER root
ENV  USER=root HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]