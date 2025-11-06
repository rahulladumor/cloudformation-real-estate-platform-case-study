#!/bin/bash
aws cloudformation validate-template \
  --template-body file://TapStack.yml
echo "✅ Template valid"
