FROM        nikolaik/python-nodejs:python3.9-nodejs16

LABEL       author="Shaikh Nedab" maintainer="shaikhnedab@gmail.com"

RUN apt update  \
    && apt -y clean \
    && apt install -y iproute2 \
    && apt install -y curl \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

RUN npm install -g gamedig
RUN python -m pip install -r requirements.txt

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]