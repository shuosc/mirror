#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DIR=/home/data/nfs2/wget/

echo "Now is" `date +%Y-%m-%d-%H:%M:%S.`
wget -P $DIR -c -r -np -k -L -p -e robots=off https://repo.continuum.io
#find $DIR/repo.continuum.io -regex '.*\.[0-9]\|.*\index.html' -print -exec rm -f {} \;