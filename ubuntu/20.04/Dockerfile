FROM        ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive \
ENV TZ=Asia/Kolkata apt-get \
RUN apt-get install -y tzdata \

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