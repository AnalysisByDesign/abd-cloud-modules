# --------------------------------------------------------------------------------------------
# ECS Service Variables
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the service (up to 255 letters, numbers, hyphens, and underscores)"
  type        = "string"
}

variable "cluster_id" {
  description = "ARN of an ECS cluster"
  type        = "string"
}

variable "task_definition" {
  description = "The family and revision (family:revision) or full ARN of the task definition"
  type        = "string"
}

variable "subnet_ids" {
  description = "The subnets associated with the task or service"
  type        = "list"
}

variable "container_name" {
  description = "The name of the container to associate with the load balancer"
  type        = "string"
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer"
  type        = "string"
}

variable "target_group_arn" {
  description = "The ARN of the Load Balancer target group to associate with the service"
  type        = "string"
}

variable "security_group_id" {
  description = "Security group id to associate with the created resources"
  type        = "string"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running"
  type        = "string"
  default     = "1"
}

variable "launch_type" {
  description = "The launch type on which to run your service. The valid values are EC2 and FARGATE. Defaults to EC2"
  type        = "string"
  default     = "EC2"
}

variable "scheduling_strategy" {
  description = "he scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA"
  type        = "string"
  default     = "REPLICA"
}

variable "deployment_minimum_healthy_percent" {
  description = "The lower percentage limit of the number of healthy tasks in a service during a deployment"
  type        = "string"
  default     = "50"
}

variable "deployment_maximum_percent" {
  description = "The lower percentage limit of the number of healthy tasks in a service during a deployment"
  type        = "string"
  default     = "200"
}

variable depends_on {
  type    = "list"
  default = []
}
