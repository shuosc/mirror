FROM shuosc/ubuntu:latest

LABEL maintainer "zhonger <zhonger@live.cn>"

RUN apt-get update && apt-get install -y build-essential wget && \
    perl -MCPAN -e "install Geo::IP::PurePerl" && \
    perl -MCPAN -e "install Geo::IP" && \
    perl -MCPAN -e "install URI::Escape" && \
    cd ~ && wget https://prdownloads.sourceforge.net/awstats/awstats-7.7.tar.gz && \
    tar zxf awstats-7.7.tar.gz && mv awstats-7.7 /usr/local/awstats && \
    mkdir -p /usr/local/awstats/geoip/ && cd /usr/local/awstats/geoip/ && \
    wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz && gzip -d GeoLiteCity.dat.gz && \
    wget http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz && gzip -d GeoIPv6.dat.gz && \
    wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz && gzip -d GeoLiteCityv6.dat.gz && \
    apt-get --purge remove -y build-essential wget vim

VOLUME [ "/opt/awstats/" ]
VOLUME [ "/var/lib/awstats" ]
VOLUME [ "/var/log/nginx/" ]

ENV DOMAIN mirrors.shu.edu.cn
ENV TIME 1m

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]