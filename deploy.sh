#!/bin/sh

# This script automates the deployment of a Dockerized application.
echo "Starting deployment process..."
git pull

# Build the Docker image
echo "Building Docker image..."
docker build -t backend-barterkita:latest .

# Stop and remove existing containers
echo "Stopping and removing existing containers..."
docker-compose down

# Start containers in detached mode
echo "Starting containers..."
docker-compose up -d

# Show logs
echo "Showing container logs..."
docker-compose logs -f backend-barterkita