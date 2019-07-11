#!/bin/bash

serviceName=dms2-thirdparty
path=$serviceName

echo "Build & packaging... $serviceName"

cd $path
mvn clean install -DskipTests

echo Packaging...
mvn package -DskipTests

echo Go back ...
cd ..

echo Install package into docker container...
docker-compose build --force-rm image-service

echo Starting image-service...
docker-compose up --remove-orphans image-service

