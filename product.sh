#!/bin/bash

serviceName=dms2-product
path=$serviceName

echo "Build & packaging... $serviceName"

cd $path
mvn clean install -DskipTests

echo Packaging...
mvn package -DskipTests

echo Go back ...
cd ..

echo Install package into docker container...
docker-compose build --force-rm product-service

echo Starting product-service...
docker-compose up --remove-orphans product-service

