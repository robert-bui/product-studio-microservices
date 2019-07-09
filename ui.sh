#!/bin/bash

echo "Get latest code..."
cd dmsui_2_0
git pull

echo "Build UI..."
yarn install

echo "Start...UI..."
yarn dev &
open http://localhost:3001

