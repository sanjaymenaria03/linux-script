#!/bin/bash

#########################################
# Author : Sanjay
# Date : 31st August
#
# Version: v1
#
# This script will report the AWS resource usage.
# # # # # # # # # # #
# AWS S3
# AWS EC2
# AWS lambda
# AWs IAM users
set -x
# list S3 buckets
echo "print list of s3 buckets"
aws s3 ls >> resource_tracker.txt
# list EC2 Instances
echo "print list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resource_tracker.txt
# list Lambda
echo "print list of lambda functions"
aws lambda list-functions >> resource_tracker.txt
# list IAM users
echo "print list of IAM users"
aws iam list-users >> resource_tracker.txt

