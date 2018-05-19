#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DIR=/home/data/wget/

wget -P $DIR -c -r -np -k -L -p -e robots=off  http://cache.ruby-china.org/
find $DIR/cache.ruby-china.org -regex '.*\.[0-9]\|.*\index.html' -print -exec rm -f {} \;

cd $DIR/cache.ruby-china.org/pub/ruby

rm index.txt
wget -c http://cache.ruby-china.org/pub/ruby/index.txt