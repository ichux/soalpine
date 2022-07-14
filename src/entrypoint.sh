#!/bin/sh
set -e

# Prime the DB
while ! nc -z $DB_NETWORK 5432; do sleep 0.5; echo "$DB_NETWORK:5432"; done

if [ "$1" = 'daemon' ]; then
    exec /usr/bin/python3 -m http.server 8000 --directory /
fi

exec "$@"
