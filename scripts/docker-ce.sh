#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

wget -P /home/data/wget -m -e robots=off -U "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6" https://download.docker.com

find /home/data/wget/download.docker.com -regex '.*\.[0-9]\|.*\index.html' -print -exec rm -f {} \;