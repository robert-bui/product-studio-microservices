#!/bin/bash

echo '$1 = ' $1

echo --------------- Checkout all submodules to branch = $1 ---------------
git submodule foreach --recursive git checkout $1

echo ------------------- Git pull all submodules --------------------------
git submodule foreach --recursive git pull