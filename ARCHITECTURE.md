# 🏗️ Real Estate Platform Architecture

## Overview

**Multi-tier, microservices-based architecture** combining serverless and containerized components for optimal performance and cost.

## Architecture Layers

### 1. Frontend Layer (CDN)
- **CloudFront**: Global CDN for static assets
- **S3**: Storage for images, 3D tours
- **WAF**: Protection against attacks

### 2. Application Layer (Containers)
- **ECS Fargate**: Containerized web application
- **ALB**: Load balancing across tasks
- **Auto Scaling**: Based on CPU/memory

### 3. API Layer (Serverless)
- **API Gateway**: RESTful APIs
- **Lambda**: Mortgage calculator, image processing
- **Cognito**: User authentication

### 4. Data Layer
- **Aurora MySQL**: Primary database + read replicas
- **DynamoDB**: User data (favorites, history)
- **ElastiCache Redis**: Caching & sessions
- **OpenSearch**: Geospatial search engine

### 5. Storage Layer
- **S3**: Property images, documents
- **CloudFront**: CDN delivery
- **Lambda**: Image optimization

### 6. Communication Layer
- **SES**: Email notifications
- **EventBridge**: Event routing
- **SNS**: Push notifications

### 7. Monitoring Layer
- **CloudWatch**: Metrics, logs, alarms
- **X-Ray**: Distributed tracing
- **CloudWatch Dashboard**: Operational visibility

## Key Design Decisions

### Why ECS Fargate?
- **Serverless containers**: No EC2 management
- **Flexible**: Any language/framework
- **Scalable**: Auto-scaling built-in
- **Cost**: Pay per task, not per instance

### Why Aurora MySQL?
- **Performance**: 5x faster than MySQL
- **Scalability**: Read replicas for scaling
- **HA**: Multi-AZ automatic failover
- **Managed**: Automated backups, patching

### Why OpenSearch?
- **Geospatial**: Native geo-queries
- **Full-text**: Property description search
- **Faceted**: Filter by price, location, type
- **Scalable**: Horizontal scaling

### Why DynamoDB?
- **Fast**: Single-digit ms latency
- **Scalable**: Unlimited throughput
- **Serverless**: Pay per request
- **Perfect for**: User data, sessions

### Why ElastiCache Redis?
- **Performance**: Sub-ms latency
- **Geospatial**: GEORADIUS for proximity
- **Sessions**: Shared across ECS tasks
- **Caching**: Search results, queries

## Data Flow

### Property Search
1. User searches on frontend
2. Query hits ElastiCache (cache)
3. If miss, query OpenSearch
4. Results cached for 5 minutes
5. Return to user (<100ms)

### Property Listing
1. Agent uploads via API Gateway
2. Lambda processes images
3. Store in S3, metadata in Aurora
4. Index in OpenSearch
5. Invalidate cache

### User Authentication
1. Login via Cognito
2. JWT token returned
3. API Gateway validates token
4. Access application resources

## Scalability

### Horizontal Scaling
- **ECS Tasks**: 2 → 20 tasks
- **Aurora**: Read replicas (up to 15)
- **OpenSearch**: Add nodes
- **Lambda**: Automatic

### Vertical Scaling
- **ECS**: Larger task sizes
- **Aurora**: Larger instances
- **ElastiCache**: Larger nodes
- **OpenSearch**: Larger nodes

### Geographic Scaling
- **CloudFront**: Global CDN
- **Aurora**: Global database
- **Multi-region**: Future expansion

## High Availability

- **Multi-AZ**: All services
- **Auto-healing**: ECS task replacement
- **Failover**: Aurora automatic
- **Redundancy**: Multiple AZs

## Security

- **WAF**: Application firewall
- **Security Groups**: Network isolation
- **IAM**: Least privilege
- **Encryption**: All data (KMS)
- **Cognito**: User authentication
- **Private Subnets**: Database isolation

## Cost Optimization

- **Fargate Spot**: 70% savings (non-critical tasks)
- **Aurora Serverless**: Auto-pause
- **ElastiCache reserved**: 30% savings
- **S3 Intelligent-Tiering**: Auto-optimize
- **CloudFront**: Cache everything

## Performance Optimization

- **Caching**: Redis + CloudFront
- **Read replicas**: Distribute queries
- **OpenSearch**: Fast search
- **Lambda**: Parallel processing
- **CDN**: Global delivery

## Monitoring

- **CloudWatch**: All metrics
- **Alarms**: Auto-scaling triggers
- **Dashboards**: Operational view
- **X-Ray**: Request tracing
- **Logs**: Centralized logging

See [README](README.md) for full details.
