#!/bin/bash

date
echo "任务开始执行："
mkdir -p /var/lib/awstats /etc/awstats /opt/awstats/visitor /opt/awstats/data
cp /opt/awstats/awstats.$DOMAIN.conf /etc/awstats/awstats.$DOMAIN.conf

/usr/local/awstats/tools/awstats_updateall.pl now --awstatsprog=/usr/local/awstats/wwwroot/cgi-bin/awstats.pl
/usr/local/awstats/tools/awstats_buildstaticpages.pl -config=$DOMAIN -lang=cn -awstatsprog=/usr/local/awstats/wwwroot/cgi-bin/awstats.pl -dir=/opt/awstats/visitor

cp -r /usr/local/awstats/wwwroot/icon /opt/awstats/visitor/icon
cp -r /usr/local/awstats/wwwroot/js /opt/awstats/visitor/js
cp -r /usr/local/awstats/wwwroot/css /opt/awstats/visitor/css
cp /opt/awstats/logo.png /opt/awstats/visitor/icon/other

date
echo "任务完成，即将睡眠" $TIME
echo -e '\n\n\n'
sleep $TIME