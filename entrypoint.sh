#!/bin/sh

sed -i 's/DOMAIN/'"$DOMAIN"'/g' hanayo.conf
exec "$@"