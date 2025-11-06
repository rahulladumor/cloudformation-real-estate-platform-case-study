# 🎤 Interview Points

## Summary
"Designed complete real estate platform handling 50K listings and 30K users using ECS Fargate, Aurora, OpenSearch, and Lambda. Hybrid serverless/container architecture with sub-100ms cached queries, multi-AZ HA, and costs $200-1200/month depending on scale."

## Key Decisions

**Why ECS Fargate?**
- Serverless containers
- No EC2 management
- Auto-scaling
- Cost-effective

**Why OpenSearch?**
- Geospatial queries
- Full-text search
- Faceted filtering
- Scalable

**Why Aurora vs RDS?**
- 5x performance
- Auto-scaling storage
- Read replicas
- Better for production

## Trade-offs
- Fargate vs EKS (simpler vs more control)
- Aurora vs DynamoDB (relational vs NoSQL)
- OpenSearch vs Algolia (self-hosted vs managed)

## Production Improvements
1. Multi-region deployment
2. Enhanced monitoring
3. Blue-green deployments
4. Disaster recovery
