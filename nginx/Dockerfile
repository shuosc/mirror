FROM shuosc/ubuntu:latest

LABEL maintainer "zhonger <zhonger@live.cn>"

COPY nginx.list /etc/apt/sources.list.d/

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 8B3981E7A6852F782CC4951600A6F0A3C300EE8C && \
    apt-get update && \
    apt-get install -y nginx supervisor && \
    rm -rf /var/www/html/index.nginx-debian.html

COPY super-nginx.conf /etc/supervisor/conf.d/
COPY default /etc/nginx/sites-available/

ADD . /opt/nginx
WORKDIR /opt/nginx
RUN apt-get install -y wget tar build-essential libpcre3 libpcre3-dev libxslt1-dev libgd-dev libgeoip-dev libssl-dev &&\
    wget https://nginx.org/download/nginx-1.14.0.tar.gz && tar zxf nginx-1.14.0.tar.gz && \
    wget https://github.com/aperezdc/ngx-fancyindex/archive/v0.4.2.tar.gz && tar zxf v0.4.2.tar.gz && \
    cd nginx-1.14.0 && ./configure --with-cc-opt='-g -O2 -fPIE -fstack-protector-strong -Wformat -Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now -fPIC' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_v2_module --with-http_dav_module --with-http_slice_module --with-threads --with-http_addition_module --with-http_geoip_module=dynamic --with-http_gunzip_module --with-http_gzip_static_module --with-http_image_filter_module=dynamic --with-http_sub_module --with-http_xslt_module=dynamic --with-stream=dynamic --with-stream_ssl_module --with-stream_ssl_preread_module --with-mail=dynamic --with-mail_ssl_module --add-module=../ngx-fancyindex-0.4.2 && \
    make -j8 && mv /usr/sbin/nginx /usr/bin/nginx.bak && \
    cp objs/nginx /usr/sbin/nginx && \
    apt-get --purge remove -y build-essential libpcre3-dev libxslt1-dev libgd-dev libgeoip-dev libssl-dev 

VOLUME [ "/var/www/data/" ]

EXPOSE 80

CMD [ "/opt/nginx/entrypoint.sh" ]