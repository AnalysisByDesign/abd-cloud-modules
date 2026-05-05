# abd-cloud-modules

Reusable Terraform child modules for the AbD Cloud infrastructure platform. Each module is self-contained — no module calls another module — making them independently testable and composable.

## Module Catalogue

### Storage
| Module | Description |
|--------|-------------|
| [storage/aws-s3](storage/aws-s3/) | S3 bucket with encryption, versioning, lifecycle, logging, ACL, and optional bucket policy |
| [storage/efs](storage/efs/) | EFS file system with mount targets across AZs and optional KMS encryption |

### Compute
| Module | Description |
|--------|-------------|
| [compute/alb](compute/alb/) | Application Load Balancer with HTTPS listener, HTTP→HTTPS redirect, target group, and optional WAFv2 association |
| [compute/asg](compute/asg/) | Auto Scaling Group consuming a launch template |
| [compute/docker-repository](compute/docker-repository/) | ECR repository with lifecycle policy and optional access policy |
| [compute/ec2](compute/ec2/) | Single EC2 instance |
| [compute/ecs/cluster](compute/ecs/cluster/) | ECS cluster |
| [compute/ecs/service](compute/ecs/service/) | ECS service with load balancer integration |
| [compute/ecs/task](compute/ecs/task/) | ECS task definition |
| [compute/elb](compute/elb/) | Classic Elastic Load Balancer (legacy) |
| [compute/launch-template](compute/launch-template/) | EC2 launch template for use with ASGs |
| [compute/nlb](compute/nlb/) | Network Load Balancer with TCP listener and target group |

### Database
| Module | Description |
|--------|-------------|
| [database/cluster-param-group](database/cluster-param-group/) | Aurora RDS cluster parameter group |
| [database/dynamodb](database/dynamodb/) | DynamoDB table (pre-configured for Terraform state locking) |
| [database/param-group](database/param-group/) | RDS DB instance parameter group |

### Network
| Module | Description |
|--------|-------------|
| [network/cache-subnet-group](network/cache-subnet-group/) | ElastiCache subnet group |
| [network/db-subnet-group](network/db-subnet-group/) | RDS DB subnet group |
| [network/dns/alias-record](network/dns/alias-record/) | Route53 alias record (A/AAAA pointing to AWS resources) |
| [network/dns/delegation-set](network/dns/delegation-set/) | Route53 reusable delegation set |
| [network/dns/private-zone](network/dns/private-zone/) | Route53 private hosted zone |
| [network/dns/public-zone](network/dns/public-zone/) | Route53 public hosted zone |
| [network/dns/record](network/dns/record/) | Route53 standard DNS record (A, CNAME, MX, TXT, etc.) |
| [network/dns/zone-association](network/dns/zone-association/) | Route53 zone–VPC association for private DNS |

### Security
| Module | Description |
|--------|-------------|
| [security/iam-policy](security/iam-policy/) | IAM policy from a policy document |
| [security/iam-role](security/iam-role/) | IAM roles with attached policies, supports multiple role definitions per invocation |
| [security/secret-store](security/secret-store/) | SSM Parameter Store secret with lifecycle ignore to preserve manual updates |
| [security/security-group](security/security-group/) | EC2 security group (no inline rules) |
| [security/security-group-rule-cidr](security/security-group-rule-cidr/) | Security group rule from a CIDR block |
| [security/security-group-rule-link](security/security-group-rule-link/) | Security group rule referencing a source security group |
| [security/ssl-certs](security/ssl-certs/) | ACM certificate with automatic DNS validation via Route53 |
| [security/ssh-key](security/ssh-key/) | EC2 key pair from a public key file |

### Cache
| Module | Description |
|--------|-------------|
| [cache/cluster-param-group](cache/cluster-param-group/) | ElastiCache parameter group |

### Integrate
| Module | Description |
|--------|-------------|
| [integrate/queue](integrate/queue/) | SQS queue (standard or FIFO) with optional dead-letter queue |

### Monitoring
| Module | Description |
|--------|-------------|
| [monitoring/cloudwatch/group](monitoring/cloudwatch/group/) | CloudWatch log groups |

## Usage

Modules are consumed from the `abd-cloud` template repository. During development, sources use local relative paths:

```hcl
module "example" {
  source = "../../../../abd-cloud-modules/compute/alb"
  # ...
}
```

After a release is tagged, sources switch to versioned remote refs:

```hcl
module "example" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//compute/alb?ref=v1.0.0"
  # ...
}
```

## Requirements

| Tool | Version |
|------|---------|
| Terraform | >= 1.9.0 |
| AWS Provider | ~> 5.0 |

## Pre-commit

Install hooks to enforce formatting, validation, and auto-generate module docs on every commit:

```bash
pip install pre-commit
pre-commit install
```

The hooks run `terraform fmt`, `terraform validate`, and `terraform-docs` on any changed module directories. See [.pre-commit-config.yaml](.pre-commit-config.yaml) and [.terraform-docs.yml](.terraform-docs.yml) for configuration.
