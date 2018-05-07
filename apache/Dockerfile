FROM shuosc/ubuntu:latest

LABEL maintainer "zhonger <zhonger@live.cn>"

RUN apt-get update && \
    apt-get install -y apache2 supervisor &&\
    rm -rf /var/www/html/index.html

VOLUME [ "/var/www/data/" ]

EXPOSE 80

ADD . /opt/apache2
CMD [ "/opt/apache2/entrypoint.sh" ]