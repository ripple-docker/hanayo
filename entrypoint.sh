#!/bin/sh

sed -i 's/DOMAIN/'"$DOMAIN"'/g' hanayo.conf
sed -i 's/MYSQL_ROOT_PASSWORD/'"$MYSQL_ROOT_PASSWORD"'/g' hanayo.conf
exec "$@"