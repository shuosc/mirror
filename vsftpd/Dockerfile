FROM shuosc/ubuntu:latest

LABEL maintainer "zhonger <zhonger@live.cn>"

RUN apt-get update && \
    apt-get install -y vsftpd supervisor

ADD . /opt/vsftpd
WORKDIR /opt/vsftpd
RUN cp vsftpd.conf /etc/vsftpd.conf && \
    cp super-vsftpd.conf /etc/supervisor/conf.d

EXPOSE 21 5010-5020

VOLUME [ "/var/www/ftp/" ]

CMD [ "/opt/vsftpd/entrypoint.sh" ]