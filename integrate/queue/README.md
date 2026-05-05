# integrate/queue

Creates an SQS queue (standard or FIFO) with configurable message retention, visibility timeout, and an optional dead-letter queue with a redrive policy.

## Overview

For FIFO queues, the queue name is automatically suffixed with `.fifo` as required by AWS. When a dead-letter queue ARN is supplied, a redrive policy is attached that moves messages to the DLQ after `max_receive_count` failed processing attempts. Typical use in this platform is for application event notifications and decoupled processing between the web tier and background workers.

## Usage

```hcl
module "app_queue" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//integrate/queue?ref=v1.0.0"

  name        = "my-app-events"
  common_tags = local.common_tags
}
```

With dead-letter queue:

```hcl
module "app_queue" {
  source = "git@github.com:AnalysisByDesign/abd-cloud-modules.git//integrate/queue?ref=v1.0.0"

  name                = "my-app-events"
  dlq_arn             = module.dlq.arn
  max_receive_count   = 3
  common_tags         = local.common_tags
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
