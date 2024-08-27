#!/bin/bash

set -x

# Assign arguments to variables
AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2
AWS_REGION=$3
AWS_REGISTRY_ID=$4
AWS_ECR_REPOSITORY=$5
IMAGE_TAG=$6

# Validate that all required variables are set
if [[ -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" || -z "$AWS_REGION" || -z "$AWS_REGISTRY_ID" || -z "$AWS_ECR_REPOSITORY" || -z "$IMAGE_TAG" ]]; then
  echo "Error: All arguments (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION, AWS_REGISTRY_ID, AWS_ECR_REPOSITORY, IMAGE_TAG) must be provided."
  exit 1
fi

# Optionally configure the AWS CLI with these credentials
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
aws configure set region "$AWS_REGION"

# Execute the AWS CLI command
aws ecr-public describe-images \
  --registry-id "$AWS_REGISTRY_ID" \
  --repository-name "$AWS_ECR_REPOSITORY" \
  --region "$AWS_REGION" \
  --image-ids imageTag="$IMAGE_TAG" 2>&1

echo "aws_output=$?" >> $GITHUB_OUTPUT
