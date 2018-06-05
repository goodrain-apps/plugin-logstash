#!/bin/bash

if [ ! -z "$plugin" ];then
    logstash-plugin install $plugin
fi

if [ ! -z "$remote_conf_url" ];then
    rm /etc/logstash/conf.d/goodrain_default.conf
    curl $remote_conf_url -o /etc/logstash/conf.d/
elif [ ! -z "$local_conf_url" ];then
    rm rm /etc/logstash/conf.d/goodrain_default.conf
    cp -a /app/$local_conf_url /etc/logstash/conf.d/
else
    sed -i "s#GRLOGTYPE#${GRLOGTYPE:-systemlog}#g" /etc/logstash/conf.d/goodrain_default.conf
    sed -i "s#GRLOGPATH#${GRLOGPATH:-/var/log/messages}#g" /etc/logstash/conf.d/goodrain_default.conf
    sed -i "s#GRLOGPOSITION#${GRLOGPOSITION:-beginning}#g" /etc/logstash/conf.d/goodrain_default.conf
    sed -i "s#GRLOGINTERVAL#${GRLOGINTERVAL:-10}#g" /etc/logstash/conf.d/goodrain_default.conf
    sed -i "s#ELASTICSEARCH_HOST#${ELASTICSEARCH_HOST:-127.0.0.1:9200}#g" /etc/logstash/conf.d/goodrain_default.conf
    sed -i "s#GRCODEC#${GRCODEC:-rubydebug}#g" /etc/logstash/conf.d/goodrain_default.conf
    sed -i "s#GREPASS#${GREPASS:-MagicWord}#g" /etc/logstash/conf.d/goodrain_default.conf
    sed -i "s#GREUSER#${GREUSER:-elastic}#g" /etc/logstash/conf.d/goodrain_default.conf
fi

if [ "$1" = "bash" ];then
    exec /bin/bash
elif [ "$1" = "version" ];then
    exec logstash --version
else
    exec /usr/share/logstash/bin/logstash "--path.settings" "/etc/logstash"
fi