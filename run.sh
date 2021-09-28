#!/bin/bash

docker-compose up -d

if [ $? -eq 0 ]; then
    sleep 5
    docker-compose exec openlitespeed chown -R nobody:nogroup localhost/html
fi