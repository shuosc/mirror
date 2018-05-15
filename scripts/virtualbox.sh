#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DIR=/home/data/nfs2/wget/

wget -P $DIR -c -r -np -k -L -p -e robots=off http://download.virtualbox.org/virtualbox/debian/pool/contrib/v/virtualbox-5.2/
find $DIR/download.virtualbox.org/ -regex '.*\.[0-9]\|.*\index.html' -print -exec rm -f {} \;