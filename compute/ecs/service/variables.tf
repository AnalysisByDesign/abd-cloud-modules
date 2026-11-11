# --------------------------------------------------------------------------------------------
# ECS Service Variables
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the service (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
}

variable "cluster_id" {
  description = "ARN of an ECS cluster"
  type        = string
}

variable "task_definition" {
  description = "The family and revision (family:revision) or full ARN of the task definition"
  type        = string
}

variable "common_tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "task_definition_managed_externally" {
  description = "CI registers new task definition revisions and updates the service, so Terraform ignores task_definition after creating the service"
  type        = bool
  default     = false
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running"
  type        = string
  default     = "1"
}

variable "launch_type" {
  description = "The launch type (EC2, FARGATE or EXTERNAL). Ignored when capacity_provider_strategy is set"
  type        = string
  default     = "EC2"
}

variable "capacity_provider_strategy" {
  description = "Capacity provider strategy for the service. Leave empty to use launch_type, or the cluster's default strategy when launch_type is null"
  type = list(object({
    capacity_provider = string
    weight            = optional(number, 1)
    base              = optional(number, 0)
  }))
  default = []
}

variable "scheduling_strategy" {
  description = "The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA"
  type        = string
  default     = "REPLICA"
}

variable "deployment_minimum_healthy_percent" {
  description = "The lower percentage limit of the number of healthy tasks in a service during a deployment"
  type        = string
  default     = "50"
}

variable "deployment_maximum_percent" {
  description = "The upper percentage limit of the number of running tasks in a service during a deployment"
  type        = string
  default     = "200"
}

variable "deployment_circuit_breaker" {
  description = "Stop a failing deployment and roll back to the last completed one"
  type        = bool
  default     = true
}

variable "health_check_grace_period_seconds" {
  description = "Seconds to ignore failing load balancer health checks after a task starts. Only valid with a load balancer"
  type        = number
  default     = null
}

variable "load_balancers" {
  description = "Target groups to register the service's tasks with"
  type = list(object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  }))
  default = []
}

variable "subnet_ids" {
  description = "Subnets for awsvpc network mode. Leave empty for bridge or host mode"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security groups for awsvpc network mode"
  type        = list(string)
  default     = []
}

variable "service_registries" {
  description = "Cloud Map service registries. awsvpc tasks need only registry_arn (A records); bridge and host tasks need container_name and container_port (SRV records)"
  type = list(object({
    registry_arn   = string
    port           = optional(number)
    container_name = optional(string)
    container_port = optional(number)
  }))
  default = []
}

variable "placement_constraints" {
  description = "Placement constraints, e.g. { type = \"memberOf\", expression = \"attribute:ecs.instance-type =~ t4g.*\" } or { type = \"distinctInstance\" }"
  type = list(object({
    type       = string
    expression = optional(string)
  }))
  default = []
}

variable "ordered_placement_strategy" {
  description = "Task placement strategies, applied in order (e.g. spread by attribute:ecs.availability-zone, then binpack by memory)"
  type = list(object({
    type  = string
    field = optional(string)
  }))
  default = []
}

variable "enable_execute_command" {
  description = "Allow ECS Exec into the service's containers (the task role then needs the SSM messages permissions)"
  type        = bool
  default     = false
}

variable "wait_for_steady_state" {
  description = "Make apply wait until the service reaches a steady state"
  type        = bool
  default     = false
}

variable "service_tags" {
  description = "Additional tags for the service"
  type        = map(string)
  default     = {}
}
