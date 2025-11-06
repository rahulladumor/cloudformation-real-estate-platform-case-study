#!/bin/bash
aws cloudformation create-stack \
  --stack-name real-estate-platform \
  --template-body file://TapStack.yml \
  --capabilities CAPABILITY_IAM \
  --region us-east-2
echo "Deploying real estate platform..."
