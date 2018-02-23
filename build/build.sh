#!/usr/bin/env bash

docker build -t b7s-katalon-base -f base/Dockerfile base &&
docker build -t b7s-katalon -f katalon/Dockerfile katalon