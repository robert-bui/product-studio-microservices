#!/bin/bash

serviceName=dms2-pmc
path=$serviceName

echo "Build & packaging... $serviceName"

cd $path
mvn clean install -DskipTests

echo Packaging...
mvn package -DskipTests

echo Go back ...
cd ..

echo Install package into docker container...
docker-compose build --force-rm pmc-api-service

echo Starting pmc-api-service...
docker-compose up --remove-orphans pmc-api-service

