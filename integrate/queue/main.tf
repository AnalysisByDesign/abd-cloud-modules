# --------------------------------------------------------------------------------------------
# SQS Queue
# --------------------------------------------------------------------------------------------

resource "aws_sqs_queue" "without_redrive" {
  count = var.count > 0 ? (var.deadletter_enable ? 0 : 1) : 0

  name       = var.name
  fifo_queue = var.fifo

  message_retention_seconds = var.message_retention_seconds

  max_message_size          = var.max_message_size
  delay_seconds             = var.delay_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds

  tags = merge(var.common_tags, map("Name", format("%s", var.name)))
}

resource "aws_sqs_queue" "with_redrive" {
  count = var.count > 0 ? (var.deadletter_enable ? 1 : 0) : 0

  name       = var.name
  fifo_queue = var.fifo

  message_retention_seconds = var.message_retention_seconds

  max_message_size          = var.max_message_size
  delay_seconds             = var.delay_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds

  redrive_policy = "{\"deadLetterTargetArn\":\"${var.deadletter_arn}\",\"maxReceiveCount\":4}"
  tags           = merge(var.common_tags, map("Name", format("%s", var.name)))
}
