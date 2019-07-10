#!/bin/bash

serviceName=dms2-provider
path=$serviceName

echo "Build & packaging... $serviceName"

cd $path
mvn clean install -DskipTests

echo Packaging...
mvn package -DskipTests

echo Go back ...
cd ..

echo Install package into docker container...
docker-compose build --force-rm partner-service

echo Starting partner-service...
docker-compose up --remove-orphans partner-service

