#!/bin/sh

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: ./update.sh <version>"
  exit 1
fi

# Pull the new image version
echo "Pulling Docker image with version: $VERSION"
docker-compose pull

# Stop and remove existing containers
echo "Stopping and removing existing containers..."
docker-compose down

# Start containers with the new image version
echo "Starting containers with version $VERSION..."
docker-compose up -d

# Show logs
echo "Showing container logs..."
docker-compose logs -f
