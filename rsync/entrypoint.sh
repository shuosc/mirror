#!/bin/bash

cd /opt/rsync/
cp conf/rsyncd.conf /etc/rsyncd.conf
cp conf/rsyncd.motd /etc/rsyncd.motd

lens=$(awk 'END{print NR}' corsync.ini)
i=1

while(( "$i" <= "$lens" ))
do
    odir=$(awk 'NR=='$i' {print $1}' corsync.ini)
    ndir=$(awk 'NR=='$i' {print $2}' corsync.ini)
    mkdir -p "/var/www/rsync/"$ndir
    mount --bind "/var/www/data/"$odir "/var/www/rsync/"$ndir
    echo -e >> /etc/rsyncd.conf
    echo "["$ndir"]" >> /etc/rsyncd.conf
    echo "path=/var/www/rsync/"$ndir >> /etc/rsyncd.conf
    ((i++))
done

/usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf "$@"