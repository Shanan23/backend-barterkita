#!/bin/sh

# This script automates the deployment of a Dockerized application.
VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

echo "Starting deployment process..."
git pull

# Build the Docker image with no cache and version tag
echo "Building Docker image with no cache and version tag $VERSION..."
docker build --no-cache -t backend-barterkita:$VERSION .

# Stop and remove existing containers
echo "Stopping and removing existing containers..."
docker-compose down

# Start containers in detached mode
echo "Starting containers..."
docker-compose up -d

# Show logs
echo "Showing container logs..."
docker-compose logs -f backend-barterkita
