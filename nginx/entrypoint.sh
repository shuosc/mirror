#!/bin/bash

cd /opt/nginx/

lens=$(awk 'END{print NR}' cohttp.ini)
i=1

while(( "$i" <= "$lens" ))
do
    odir=$(awk 'NR=='$i' {print $1}' cohttp.ini)
    ndir=$(awk 'NR=='$i' {print $2}' cohttp.ini)
    ln -s "/var/www/data/"$odir "/var/www/html/"$ndir
    ((i++))
done

ln -s /opt/nginx/fancyindex /var/www/html/fancyindex

chown -R www-data:www-data /var/www/html

supervisord -c /etc/supervisor/supervisord.conf