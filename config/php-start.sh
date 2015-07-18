#!/bin/bash

if [ "$XDEBUG_ENABLED" = true ]; then

    sed -i "s|%data-root%|${DATA_ROOT:-/data}|" /opt/etc/xdebug.ini

    cat /opt/etc/xdebug.ini >> /etc/hhvm/server.ini
    cat /opt/etc/errors.ini >> /etc/hhvm/server.ini


    cat /opt/etc/xdebug.ini >> /etc/hhvm/php.ini
    cat /opt/etc/errors.ini >> /etc/hhvm/php.ini
fi

exec hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000