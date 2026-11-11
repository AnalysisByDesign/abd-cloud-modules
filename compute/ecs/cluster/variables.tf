# --------------------------------------------------------------------------------------------
# ECS Cluster Variables
# --------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the cluster"
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

variable "ecs_insights" {
  description = "Container Insights: disabled, enabled or enhanced"
  type        = string
  default     = "disabled"

  validation {
    condition     = contains(["disabled", "enabled", "enhanced"], var.ecs_insights)
    error_message = "ecs_insights must be disabled, enabled or enhanced."
  }
}

variable "ecs_tags" {
  description = "Additional tags for the cluster"
  type        = map(string)
  default     = {}
}

variable "capacity_providers" {
  description = "EC2 capacity providers keyed by name (which must not start with aws, ecs or fargate), each backed by an Auto Scaling group"
  type = map(object({
    auto_scaling_group_arn         = string
    managed_termination_protection = optional(string, "ENABLED")
    managed_draining               = optional(string, "ENABLED")
    managed_scaling                = optional(string, "ENABLED")
    target_capacity                = optional(number, 100)
    minimum_scaling_step_size      = optional(number, 1)
    maximum_scaling_step_size      = optional(number, 1)
    instance_warmup_period         = optional(number, 300)
  }))
  default = {}
}

variable "default_capacity_provider_strategy" {
  description = "The cluster's default capacity provider strategy; each capacity_provider is a key of capacity_providers"
  type = list(object({
    capacity_provider = string
    weight            = optional(number, 1)
    base              = optional(number, 0)
  }))
  default = []
}
