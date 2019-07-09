#!/bin/bash

echo "Connecting to dev db..., make sure that the host has been added to the .ssh/config file..."

open http://localhost:9091

ssh -L 9091:localhost:8091 -L 9092:localhost:8092 cb1-dev -N

