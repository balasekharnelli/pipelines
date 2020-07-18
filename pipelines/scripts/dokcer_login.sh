#!/bin/sh
ECR_URI = "784579436685.dkr.ecr.us-east-1.amazonaws.com"
AWS_REGION = "us-east-1"

echo "Docker logging into ECR"
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URI
