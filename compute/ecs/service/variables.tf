################################################################
#
# CORE:
# SERVICE: VARIABLES.TF SERVICE .
# Provides an ECS service - effectively a task that is expected to run until an error occurs or a user terminates it (typically a webserver or a database).
#
################################################################

variable "name" {
  default     = ""
  description = "The name of the service (up to 255 letters, numbers, hyphens, and underscores) "
  type        = "string"
}

variable "cluster_id" {
  default     = ""
  description = "ARN of an ECS cluster "
  type        = "string"
}

variable "task_definition" {
  default     = ""
  description = "(Required) The family and revision (family:revision) or full ARN of the task definition that you want to run in your service. "
  type        = "string"
}

variable "desired_count" {
  default     = ""
  description = "The number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy. "
  type        = "string"
}

variable "iam_role_arn" {
  default     = ""
  description = "ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf. This parameter is required if you are using a load balancer with your service, but only if your task definition does not use the awsvpc network mode. If using awsvpc network mode, do not specify this role. If your account has already created the Amazon ECS service-linked role, that role is used by default for your service unless you specify a role here. "
  type        = "string"
}

variable "launch_type" {
  default     = ""
  description = "The launch type on which to run your service. The valid values are EC2 and FARGATE. Defaults to EC2. "
  type        = "string"
}

variable "subnet_ids" {
  type        = "list"
  default     = []
  description = "The subnets associated with the task or service. "
}

variable "container_name" {
  description = "The name of the container to associate with the load balancer (as it appears in a container definition). "
  default     = ""
  type        = "string"
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer. "
  default     = ""
  type        = "string"
}

variable "target_group_arn" {
  description = "The ARN of the Load Balancer target group to associate with the service. "
  default     = ""
  type        = "string"
}

variable "security_group_id" {
  default     = ""
  description = ""
  type        = "string"
}

variable depends_on {
  default = []
  type    = "list"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "scheduling_strategy" {
  type        = "string"
  default     = "REPLICA"
  description = "he scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA."
}

variable "deployment_minimum_healthy_percent" {
  default     = "50"
  description = "The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment. Not valid when using the DAEMON scheduling strategy. "
  type        = "string"
}

variable "deployment_maximum_percent" {
  default     = "200"
  description = "The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment. Not valid when using the DAEMON scheduling strategy. "
  type        = "string"
}
