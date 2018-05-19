#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DIR=/home/data/wget/

wget -P $DIR -c -r -np -k -L -p -e robots=off http://nodejs.org/dist/
find $DIR/nodejs.org -regex '.*\.[0-9]\|.*\index.html' -print -exec rm -f {} \;

cd $DIR/nodejs.org/dist

rm index.json
wget -c http://nodejs.org/dist/index.json
