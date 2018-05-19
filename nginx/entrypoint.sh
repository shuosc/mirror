#!/bin/bash

cd /opt/nginx/

lens=$(awk 'END{print NR}' cohttp.ini)
i=1

while(( "$i" <= "$lens" ))
do
    odir=$(awk 'NR=='$i' {print $1}' cohttp.ini)
    ndir=$(awk 'NR=='$i' {print $2}' cohttp.ini)
    mkdir -p "/var/www/html/"$ndir
    mount --bind "/var/www/data/"$odir "/var/www/html/"$ndir
    ((i++))
done

mkdir -p /var/www/html/fancyindex
mount --bind /opt/nginx/fancyindex /var/www/html/fancyindex

supervisord -c /etc/supervisor/supervisord.conf