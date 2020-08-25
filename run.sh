#!/bin/bash

set -x

if [ -z ${MYSQL_DB_URL} -o -z "${MYSQL_ROOT_PASSWORD}" ]; then
    echo "DB URL OR  PASSWORD MISSING!"
    exit 1
fi

host ${MYSQL_DB_URL}
if [ $? -ne 0 ];
then
    echo "URL is not working"
    exit 1
fi

while true ;
do
  nc -i 10 -z ${MYSQL_DB_URL} 3306
  if [ $? -ne 0 ];
  then
    echo "Port is not yet up"
    sleep 30
    continue
  fi
  git clone https://rkb03:password@gitlab.com/batch46/robo-shop/mysql.git
  cd mysql
  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h ${MYSQL_DB_URL} <ratings.sql
  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h ${MYSQL_DB_URL} <shipping.sql

  exit $?
done
