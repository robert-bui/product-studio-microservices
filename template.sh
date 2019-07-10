#!/bin/bash

serviceName=dms2-template
path=$serviceName

echo "Build & packaging... $serviceName"

cd $path
mvn clean install -DskipTests

echo Packaging...
mvn package -DskipTests

echo Go back ...
cd ..

echo Install package into docker container...
docker-compose build --force-rm template-service

echo Starting template-service...
docker-compose up --remove-orphans template-service

