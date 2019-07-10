#!/bin/bash

serviceName=dms2-acl
path=$serviceName

echo "Build & packaging... $serviceName"

cd $path
mvn clean install -DskipTests

echo Packaging...
mvn package -DskipTests

echo Go back ...
cd ..

echo Install package into docker container...
docker-compose build --force-rm acl-service

echo Starting acl-service...
docker-compose up --remove-orphans acl-service

