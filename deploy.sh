#!/bin/sh

# This script automates the deployment of a Dockerized application.
echo "Starting deployment process..."
git pull

# Build the Docker image
echo "Building Docker image..."
npm run docker:build

# Stop and remove existing containers
echo "Stopping and removing existing containers..."
npm run docker:down

# Start containers in detached mode
echo "Starting containers..."
npm run docker:up

# Show logs
echo "Showing container logs..."
npm run docker:logs
