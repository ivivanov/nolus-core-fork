#!/bin/bash

set -x

AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2
AWS_REGION=$3
AWS_ECR_REGISTRY=$4
AWS_ECR_REGISTRY_ALIAS=$5
AWS_ECR_REPOSITORY=$6
DOCKERFILE=$7
IMAGE_TAG=$8

# Validate that all required variables are set
if [[ -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" || -z "$AWS_REGION" || -z "$AWS_ECR_REGISTRY" || -z "$AWS_ECR_REPOSITORY" || -z "$DOCKERFILE" || -z "$IMAGE_TAG" ]]; then
  echo "Error: All arguments (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION, AWS_ECR_REGISTRY, AWS_ECR_REPOSITORY, DOCKERFILE, IMAGE_TAG) must be provided."
  exit 1
fi

# Optionally configure the AWS CLI with these credentials
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set region "$AWS_REGION"

TAG="$AWS_ECR_REGISTRY/$AWS_ECR_REGISTRY_ALIAS/$AWS_ECR_REPOSITORY:$IMAGE_TAG"
docker build -t "$TAG" -f "$DOCKERFILE" .
docker push "$TAG"
