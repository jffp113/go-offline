#!/bin/bash

NOW=v$(date +"%Y.%m.%d.%I.%M")

echo "Building and pushing version:"
echo "$NOW"

docker build -f Dockerfile -t pcmax113/go-proxy-offline:${NOW} .

docker push pcmax113/go-proxy-offline:${NOW}