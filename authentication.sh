#!/bin/bash

serviceName=dms2-authentication
path=$serviceName

echo "Build & packaging... $serviceName"

cd $path
mvn clean install -DskipTests

echo Packaging...
mvn package -DskipTests

echo Go back ...
cd ..

echo Install package into docker container...
docker-compose build --force-rm $serviceName

echo Starting api-gateway...
docker-compose up --remove-orphans $serviceName

