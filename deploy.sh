#!/usr/bin/env bash

# 1) Setting up environment variables
echo "Starting deployment..."
# this is taken from the AWS ECR push command will ensure that the Docker CLI is authenticated to your Amazon ECR registry.
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 539659138849.dkr.ecr.eu-central-1.amazonaws.com
# 2) Creating and uploading the Docker image
# directly build the Docker image from the Dockerfile in the current directory with the tag 'latest' instead of first doing 'docker build -t my-node-app .'
docker build -t 539659138849.dkr.ecr.eu-central-1.amazonaws.com/my-node-app:latest .
docker push 539659138849.dkr.ecr.eu-central-1.amazonaws.com/my-node-app:latest
# 3) Cleaning up old Docker images
echo "Cleaning up old Docker images..."
docker image rm 539659138849.dkr.ecr.eu-central-1.amazonaws.com/my-node-app:latest
