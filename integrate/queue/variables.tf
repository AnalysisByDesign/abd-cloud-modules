# --------------------------------------------------------------------------------------------
# SQS Queue
# --------------------------------------------------------------------------------------------

# Required -----------------------------------------------------------------------------------
variable "name" {
  description = "Name"
  type        = string
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# Optional -----------------------------------------------------------------------------------

variable "num_queues" {
  description = "How many queues to build"
  default     = 0
}

variable "fifo" {
  description = "Do we want a FIFO based queue"
  default     = false
}

variable "message_retention_seconds" {
  description = "Message retention period (seconds)"
  default     = 345600
}

variable "max_message_size" {
  description = "Max message size (bytes)"
  default     = 262144
}

variable "delay_seconds" {
  description = "Delivery delay in (seconds)"
  default     = 0
}

variable "receive_wait_time_seconds" {
  description = "Receive wait time (seconds)"
  default     = 0
}

variable "deadletter_enable" {
  description = "Do we have a deadletter queue?"
  default     = false
}

variable "deadletter_arn" {
  description = "Dead-letter queue arn"
  type        = string
  default     = ""
}
