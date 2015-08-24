#!/bin/bash

if [ "$XDEBUG_ENABLED" = true ]; then

    sed -i "s|%data-root%|$DATA_ROOT|" /opt/etc/xdebug.ini

    cat /opt/etc/xdebug.ini >> /etc/hhvm/server.ini
    cat /opt/etc/xdebug.ini >> /etc/hhvm/php.ini

fi

cat /opt/etc/errors.ini >> /etc/hhvm/server.ini
cat /opt/etc/errors.ini >> /etc/hhvm/php.ini

cat /opt/etc/timezone.ini >> /etc/hhvm/timezone.ini
cat /opt/etc/timezone.ini >> /etc/hhvm/timezone.ini


exec hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000