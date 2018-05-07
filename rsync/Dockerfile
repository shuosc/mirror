FROM shuosc/ubuntu:latest

LABEL maintainer "zhonger <zhonger@live.cn>"

RUN apt-get update &&\
    apt-get install -y tzdata rsync supervisor&&\
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    echo "Asia/Shanghai" > /etc/timezone &&\
    dpkg-reconfigure -f noninteractive tzdata

VOLUME [ "/var/www/data/" ]
VOLUME [ "/var/log/rsync/" ]

EXPOSE 873

ADD . /opt/rsync/

CMD [ "/opt/rsync/entrypoint.sh" ]