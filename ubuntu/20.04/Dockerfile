FROM        ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Kolkata apt-get -y install tzdata \

LABEL       author="Shaikh Nedab" maintainer="shaikhnedab@gmail.com"

RUN apt update  \
    && apt -y clean \
	&& apt -y install iproute2 ca-certificates \
    && adduser --disabled-password --home /home/container container

USER root
ENV  USER=root HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]