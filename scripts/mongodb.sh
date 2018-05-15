#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DIR=/home/data/nfs2/wget/

wget -P $DIR -c -r -np -k -L -p -e robots=off  http://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/3.6/multiverse/binary-amd64/
find $DIR/repo.mongodb.org -regex '.*\.[0-9]\|.*\index.html' -print -exec rm -f {} \;