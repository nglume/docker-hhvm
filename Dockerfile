FROM estebanmatias92/hhvm:3.5-fastcgi

MAINTAINER "Zak Henry" <zak.henry@gmail.com>

# install hhvm-pgsql
RUN apt-get update && apt-get install -y libpq-dev && rm -rf /var/lib/apt/lists/* && \
    hhvm-ext-install dstelter/hhvm-pgsql


ADD config/xdebug.ini /opt/etc/xdebug.ini
ADD config/errors.ini /opt/etc/errors.ini

# PHP startup script
ADD config/php-start.sh /opt/bin/php-start.sh
RUN chmod u=rwx /opt/bin/php-start.sh

RUN mkdir -p ${DATA_ROOT:-/data}

EXPOSE 9000

ENTRYPOINT ["/opt/bin/php-start.sh"]
