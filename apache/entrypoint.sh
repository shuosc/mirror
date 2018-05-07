#!/bin/bash

cd /opt/apache2

lens=$(awk 'END{print NR}' coapache.ini)
i=1

while(( "$i" <= "$lens" ))
do
    odir=$(awk 'NR=='$i' {print $1}' coapache.ini)
    ndir=$(awk 'NR=='$i' {print $2}' coapache.ini)
    ln -s "/var/www/data/"$odir "/var/www/html/"$ndir
    ((i++))
done

cp super-apache.conf /etc/supervisor/conf.d/

supervisord -c /etc/supervisor/supervisord.conf