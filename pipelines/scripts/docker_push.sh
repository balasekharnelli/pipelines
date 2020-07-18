#!/bin/sh
docker tag fedora:v1 784579436685.dkr.ecr.us-east-1.amazonaws.com/gocd_mages:v1

docker push 784579436685.dkr.ecr.us-east-1.amazonaws.com/gocd_mages:v1
