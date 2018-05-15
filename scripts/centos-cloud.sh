#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DIR=/home/data/wget/

wget -P $DIR -c -r -np -k -L -p -e robots=off https://cloud.centos.org/centos/7/images/
find $DIR/cloud.centos.org -regex '.*\.[0-9]\|.*\index.html.*' -print -exec rm -f {} \;