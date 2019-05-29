#!/bin/bash
set -e

echo Building the runtime image with VS Debugger installed...
cd RuntimeImage
docker build -t aspnetcore21-ssh .

echo
echo
echo Building the app...
cd ../TodoApp
docker build -t todoapp .

echo
echo
echo "Stopping running container (if any)..."
containerName="todoapp-container"
# A container might not be running, so ignore any error related to stopping it
docker stop $containerName || true
docker container rm $containerName || true

echo
echo Running the app in the container...
docker run --name $containerName -p 2222:2222 -p 5000:5000 -d todoapp