#!/bin/bash
aws cloudformation delete-stack \
  --stack-name real-estate-platform \
  --region us-east-2
echo "Deleting platform..."
