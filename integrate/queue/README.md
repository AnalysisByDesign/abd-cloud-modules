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
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_sqs_queue.with_redrive](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.without_redrive](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_deadletter_arn"></a> [deadletter\_arn](#input\_deadletter\_arn) | Dead-letter queue arn | `string` | `""` | no |
| <a name="input_deadletter_enable"></a> [deadletter\_enable](#input\_deadletter\_enable) | Do we have a deadletter queue? | `bool` | `false` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | Delivery delay in (seconds) | `number` | `0` | no |
| <a name="input_fifo"></a> [fifo](#input\_fifo) | Do we want a FIFO based queue | `bool` | `false` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | Max message size (bytes) | `number` | `262144` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | Message retention period (seconds) | `number` | `345600` | no |
| <a name="input_name"></a> [name](#input\_name) | Name | `string` | n/a | yes |
| <a name="input_num_queues"></a> [num\_queues](#input\_num\_queues) | How many queues to build | `number` | `0` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | Receive wait time (seconds) | `number` | `0` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
<!-- END_TF_DOCS -->
