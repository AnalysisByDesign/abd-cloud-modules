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
  description = "Enable or disable Container Insights"
  type        = string
  default     = "disabled"
}

variable "ecs_tags" {
  description = "Additional tags for the cluster"
  type        = map(string)
  default     = {}
}
