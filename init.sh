#!/bin/bash

if [ ! -d "web/wp-content" ]; then
  cd web; wget -O - https://wordpress.org/latest.tar.gz |tar -zxf -; mv wordpress/* ./; rmdir wordpress
  cd ../
fi

docker-compose up -d

if [ $? -eq 0 ]; then
    sleep 5
    docker-compose exec openlitespeed chown -R nobody:nogroup localhost/html
fi
