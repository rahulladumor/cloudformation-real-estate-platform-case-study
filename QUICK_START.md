# 🚀 Quick Start - Real Estate Platform

## Deploy (5 minutes setup, 30 min deployment)

```bash
aws cloudformation create-stack \
  --stack-name real-estate-platform \
  --template-body file://TapStack.yml \
  --capabilities CAPABILITY_IAM \
  --region us-east-2
```

## Wait for completion

```bash
aws cloudformation wait stack-create-complete \
  --stack-name real-estate-platform \
  --region us-east-2
```

## Access Application

```bash
# Get ALB DNS
aws cloudformation describe-stacks \
  --stack-name real-estate-platform \
  --query 'Stacks[0].Outputs[?OutputKey==`LoadBalancerDNS`].OutputValue' \
  --output text
```

## ✅ What You Get

- ✅ Complete real estate platform
- ✅ 50,000 listing capacity
- ✅ Geospatial search
- ✅ Auto-scaling
- ✅ Multi-AZ HA
- ✅ CDN delivery

**Cost**: $200-300/month (dev), $800-1,200/month (prod)

See [README](README.md) for full details.
