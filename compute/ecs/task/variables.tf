################################################################
#
# CORE:
# TASK: VARIABLES.TF TASK .
# Provides an ECS task definition to be used in aws_ecs_service.
#
################################################################
variable "family" {
  description = "A unique name for your task definition."
  type        = "string"
}

variable "container_definitions" {
  description = "A list of valid container definitions provided as a single valid JSON document."
  type        = "string"
}

# --------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# --------------------------------------------------------------------------------------------

variable "role_arn" {
  description = "Role ECS ARN"
  type        = "string"
  default     = ""
}

variable "requires_compatibilities" {
  description = "A set of launch types required by the task. The valid values are EC2 and FARGATE"
  type        = "string"
  default     = ""
}

variable "network_mode" {
  description = "The Docker networking mode - none, bridge, awsvpc or host."
  type        = "string"
  default     = ""
}

variable "cpu" {
  description = "CPU units to allocate to the tasks"
  type        = "string"
  default     = "256"
}

variable "memory" {
  description = "RAM to allocate to the tasks"
  type        = "string"
  default     = "512"
}
