# 🚀 Deployment Guide

## Prerequisites
- AWS CLI
- Docker (for ECS)
- Domain name (optional)
- SSL certificate (optional)

## Deployment

### Deploy Infrastructure
```bash
aws cloudformation create-stack \
  --stack-name real-estate-platform \
  --template-body file://TapStack.yml \
  --capabilities CAPABILITY_IAM \
  --region us-east-2
```

### Post-Deployment

1. **Configure Cognito**: Set up user pools
2. **Upload Data**: Seed initial properties
3. **Configure DNS**: Point domain to ALB
4. **SSL Certificate**: Add to ALB
5. **Test APIs**: Verify endpoints

## Monitoring

```bash
# Check ECS services
aws ecs list-services --cluster RealEstatePlatform

# Check Aurora
aws rds describe-db-clusters

# Check OpenSearch
aws es describe-elasticsearch-domain --domain-name properties
```

See [README](README.md) for details.
