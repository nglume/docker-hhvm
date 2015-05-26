#!/bin/bash

if [ "$XDEBUG_ENABLED" = true ]; then
    cat /opt/etc/xdebug.ini >> /etc/hhvm/server.ini
    cat /opt/etc/errors.ini >> /etc/hhvm/server.ini


    cat /opt/etc/xdebug.ini >> /etc/hhvm/php.ini
    cat /opt/etc/errors.ini >> /etc/hhvm/php.ini
fi

cat /etc/hhvm/server.ini
cat /etc/hhvm/php.ini

#exec /usr/sbin/php5-fpm -F

exec hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000