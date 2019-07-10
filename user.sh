#!/bin/bash

serviceName=dms2-user
path=$serviceName

echo "Build & packaging... $serviceName"

cd $path
mvn clean install -DskipTests

echo Packaging...
mvn package -DskipTests

echo Go back ...
cd ..

echo Install package into docker container...
docker-compose build --force-rm user-service

echo Starting user-service...
docker-compose up --remove-orphans user-service

