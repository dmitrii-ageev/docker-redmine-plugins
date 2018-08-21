#!/bin/bash

# Detect a database
MYSQL=$(env|grep -i mysql)
POSTGRESQL=$(env|grep -i postgres)

MYSQL=${MYSQL:+'mysql'}
POSTGRESQL=${POSTGRESQL:+'postgresql'}

# Create database file
cd /docker-entrypoint-initdb.d/
case "${MYSQL}${POSTGRESQL}" in
    'mysql')
        cat mysql/redmine-db.sql > redmine-db.sql
        ;;
    'postgresql')
        cat postgresql/redmine-db.sql > redmine-db.sql
        ;;
esac
