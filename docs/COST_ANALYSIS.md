# 💰 Cost Analysis

## Monthly Costs

### Development ($200-300/month)
- ECS Fargate: $60
- Aurora (t3.small): $50
- OpenSearch (t3.small): $40
- ElastiCache (t3.micro): $15
- S3 + CloudFront: $10
- Other: $25-125

### Production ($800-1,200/month)
- ECS Fargate (scaled): $200
- Aurora + replicas: $250
- OpenSearch (m5.large): $180
- ElastiCache (r5.large): $60
- CloudFront (50GB/day): $50
- Other: $60-460

## Optimization
1. Fargate Spot (70% off)
2. Aurora Serverless
3. Reserved instances
4. S3 Intelligent-Tiering
