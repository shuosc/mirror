#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

DIR=/home/data/wget/


wget -P $DIR -c -r -np -k -L -p -e robots=off http://packages.microsoft.com/keys/
rm -rf $DIR/packages.microsoft.com/repos/vscode/dists/stable/
wget -P $DIR -c -r -np -k -L -p -e robots=off http://packages.microsoft.com/repos/vscode/
wget -P $DIR -c -r -np -k -L -p -e robots=off http://packages.microsoft.com/yumrepos/vscode/
find $DIR/packages.microsoft.com/ -regex '.*\.[0-9]\|.*\index.html' -print -exec rm -f {} \;