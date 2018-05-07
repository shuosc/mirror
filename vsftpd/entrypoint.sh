#!/bin/bash

lens=$(awk 'END{print NR}' coftp.ini)
i=1

while(( "$i" <= "$lens" ))
do
    odir=$(awk 'NR=='$i' {print $1}' coftp.ini)
    ndir=$(awk 'NR=='$i' {print $2}' coftp.ini)
    mkdir -p "/var/www/ftp/"$ndir
    mount --bind "/var/www/ftpbase/"$odir "/var/www/ftp/"$ndir
    ((i++))
done

supervisord -c /etc/supervisor/supervisord.conf